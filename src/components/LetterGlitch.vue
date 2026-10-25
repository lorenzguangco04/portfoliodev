<script setup lang="ts">
import { onMounted, onBeforeUnmount, ref, watch } from 'vue';

const props = withDefaults(
  defineProps<{
    glitchColors?: string[];
    glitchSpeed?: number;
    centerVignette?: boolean;
    outerVignette?: boolean;
    smooth?: boolean;
  }>(),
  {
    glitchColors: () => ['#0e7490', '#38bdf8', '#123b68'],
    glitchSpeed: 33,
    centerVignette: false,
    outerVignette: true,
    smooth: true,
  },
);

const canvasRef = ref<HTMLCanvasElement | null>(null);
const letters = ref<{ char: string; color: string; targetColor: string; colorProgress: number }[]>([]);
const grid = ref({ columns: 0, rows: 0 });
const context = ref<CanvasRenderingContext2D | null>(null);
const lastGlitchTime = ref(Date.now());

const fontSize = 16;
const charWidth = 10;
const charHeight = 20;
const lettersAndSymbols = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$&*()-_+=/[]{};:<> ,0123456789';

const getRandomChar = () => lettersAndSymbols[Math.floor(Math.random() * lettersAndSymbols.length)] ?? 'A';
const getRandomColor = () => props.glitchColors[Math.floor(Math.random() * props.glitchColors.length)] ?? '#38bdf8';

const hexToRgb = (hex: string) => {
  const shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
  const normalized = hex.replace(shorthandRegex, (m, r, g, b) => r + r + g + g + b + b);
  const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(normalized);
  if (!result) return null;
  return { r: Number.parseInt(result[1], 16), g: Number.parseInt(result[2], 16), b: Number.parseInt(result[3], 16) };
};

const interpolateColor = (
  start: { r: number; g: number; b: number },
  end: { r: number; g: number; b: number },
  factor: number,
) => {
  const result = {
    r: Math.round(start.r + (end.r - start.r) * factor),
    g: Math.round(start.g + (end.g - start.g) * factor),
    b: Math.round(start.b + (end.b - start.b) * factor),
  };
  return `rgb(${result.r}, ${result.g}, ${result.b})`;
};

const calculateGrid = (width: number, height: number) => ({
  columns: Math.ceil(width / charWidth),
  rows: Math.ceil(height / charHeight),
});

const initializeLetters = (columns: number, rows: number) => {
  grid.value = { columns, rows };
  letters.value = Array.from({ length: columns * rows }, () => ({
    char: getRandomChar(),
    color: getRandomColor(),
    targetColor: getRandomColor(),
    colorProgress: 1,
  }));
};

const drawLetters = () => {
  if (!canvasRef.value || !context.value || !letters.value.length) return;

  const canvas = canvasRef.value;
  const rect = canvas.getBoundingClientRect();
  const ctx = context.value;

  ctx.clearRect(0, 0, rect.width, rect.height);
  ctx.font = `${fontSize}px monospace`;
  ctx.textBaseline = 'top';

  letters.value.forEach((letter, index) => {
    const x = (index % grid.value.columns) * charWidth;
    const y = Math.floor(index / grid.value.columns) * charHeight;
    ctx.fillStyle = letter.color;
    ctx.fillText(letter.char, x, y);
  });
};

const updateLetters = () => {
  if (!letters.value.length) return;

  const updateCount = Math.max(1, Math.floor(letters.value.length * 0.05));
  for (let i = 0; i < updateCount; i++) {
    const index = Math.floor(Math.random() * letters.value.length);
    const item = letters.value[index];
    if (!item) continue;

    item.char = getRandomChar();
    item.targetColor = getRandomColor();
    item.colorProgress = props.smooth ? 0 : 1;
    if (!props.smooth) item.color = item.targetColor;
  }
};

const handleSmoothTransitions = () => {
  let needsRedraw = false;
  letters.value.forEach((letter) => {
    if (letter.colorProgress < 1) {
      letter.colorProgress += 0.05;
      if (letter.colorProgress > 1) letter.colorProgress = 1;

      const startRgb = hexToRgb(letter.color);
      const endRgb = hexToRgb(letter.targetColor);
      if (startRgb && endRgb) {
        letter.color = interpolateColor(startRgb, endRgb, letter.colorProgress);
        needsRedraw = true;
      }
    }
  });

  if (needsRedraw) drawLetters();
};

let animationFrame: number | undefined;

const animate = () => {
  const now = Date.now();
  if (now - lastGlitchTime.value >= props.glitchSpeed) {
    updateLetters();
    drawLetters();
    lastGlitchTime.value = now;
  }

  if (props.smooth) handleSmoothTransitions();
  animationFrame = requestAnimationFrame(animate);
};

const resizeCanvas = () => {
  const canvas = canvasRef.value;
  if (!canvas) return;

  const parent = canvas.parentElement;
  if (!parent) return;

  const dpr = window.devicePixelRatio || 1;
  const rect = parent.getBoundingClientRect();

  canvas.width = rect.width * dpr;
  canvas.height = rect.height * dpr;
  canvas.style.width = `${rect.width}px`;
  canvas.style.height = `${rect.height}px`;

  if (context.value) {
    context.value.setTransform(dpr, 0, 0, dpr, 0, 0);
  }

  const { columns, rows } = calculateGrid(rect.width, rect.height);
  initializeLetters(columns, rows);
  drawLetters();
};

onMounted(() => {
  if (!canvasRef.value) return;
  context.value = canvasRef.value.getContext('2d');
  resizeCanvas();
  animate();
  window.addEventListener('resize', resizeCanvas);
});

onBeforeUnmount(() => {
  if (animationFrame) cancelAnimationFrame(animationFrame);
  window.removeEventListener('resize', resizeCanvas);
});

watch(
  () => [props.glitchColors, props.glitchSpeed, props.smooth],
  () => {
    if (canvasRef.value) resizeCanvas();
  },
  { deep: true },
);
</script>

<template>
  <canvas ref="canvasRef" class="glitch-canvas" />
</template>

<style scoped>
.glitch-canvas {
  display: block;
  width: 100%;
  height: 100%;
  border-radius: 1rem;
  background: transparent;
}
</style>
