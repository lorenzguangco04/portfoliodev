<script setup lang="ts">
import { onBeforeUnmount, onMounted, ref } from 'vue';

const canvasRef = ref<HTMLCanvasElement | null>(null);
const symbols = 'アカサタナハマヤラワ0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const fontSize = 16;
const columnWidth = 24;

type RainColumn = {
  x: number;
  y: number;
  speed: number;
  length: number;
};

let context: CanvasRenderingContext2D | null = null;
let columns: RainColumn[] = [];
let animationFrame = 0;
let lastFrameTime = 0;
let width = 0;
let height = 0;
let pixelRatio = 1;

const randomSymbol = () => symbols[Math.floor(Math.random() * symbols.length)] ?? '0';

const resizeCanvas = () => {
  const canvas = canvasRef.value;
  if (!canvas || !context) return;

  width = window.innerWidth;
  height = window.innerHeight;
  pixelRatio = Math.min(window.devicePixelRatio || 1, 1.5);
  canvas.width = width * pixelRatio;
  canvas.height = height * pixelRatio;
  context.setTransform(pixelRatio, 0, 0, pixelRatio, 0, 0);
  columns = Array.from({ length: Math.ceil(width / columnWidth) }, (_, index) => ({
    x: index * columnWidth,
    y: Math.random() * height,
    speed: 1 + Math.random() * 2.2,
    length: 6 + Math.floor(Math.random() * 15),
  }));
}

const animate = (timestamp: number) => {
  if (!context) return;
  animationFrame = requestAnimationFrame(animate);
  if (timestamp - lastFrameTime < 45) return;
  lastFrameTime = timestamp;

  context.clearRect(0, 0, width, height);
  context.font = `${fontSize}px monospace`;
  context.textBaseline = 'top';

  for (const column of columns) {
    for (let offset = 0; offset < column.length; offset++) {
      const y = column.y - offset * fontSize;
      if (y < 0 || y > height) continue;

      const opacity = (1 - offset / column.length) * 0.46;
      context.fillStyle = offset === 0
        ? `rgba(103, 232, 249, ${Math.min(opacity + 0.24, 0.8)})`
        : `rgba(56, 189, 248, ${opacity})`;
      context.fillText(randomSymbol(), column.x, y);
    }

    column.y += column.speed * fontSize * 0.55;
    if (column.y - column.length * fontSize > height) {
      column.y = -Math.random() * height * 0.35;
      column.speed = 1 + Math.random() * 2.2;
      column.length = 6 + Math.floor(Math.random() * 15);
    }
  }
};

onMounted(() => {
  const canvas = canvasRef.value;
  if (!canvas) return;
  context = canvas.getContext('2d');
  if (!context) throw new Error('Unable to initialize the rain background canvas.');

  resizeCanvas();
  animationFrame = requestAnimationFrame(animate);
  window.addEventListener('resize', resizeCanvas);
});

onBeforeUnmount(() => {
  cancelAnimationFrame(animationFrame);
  window.removeEventListener('resize', resizeCanvas);
});
</script>

<template>
  <canvas ref="canvasRef" class="rain-background" aria-hidden="true" />
</template>

<style scoped>
.rain-background {
  position: absolute;
  z-index: -1;
  inset: 0 auto auto 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  opacity: 0.72;
}
</style>
