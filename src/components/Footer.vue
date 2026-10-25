<script setup lang="ts">
import { onBeforeUnmount, onMounted, ref } from 'vue';

const currentYear = new Date().getFullYear();
const baseUrl = '/';
const showBackToTop = ref(false);
const gameDuration = 15;
const score = ref(0);
const timeLeft = ref(gameDuration);
const gameActive = ref(false);
const targetPosition = ref({ left: 50, top: 50 });
let gameTimer: ReturnType<typeof setInterval> | undefined;

const moveTarget = () => {
  targetPosition.value = {
    left: 12 + Math.random() * 76,
    top: 20 + Math.random() * 60,
  };
};

const startGame = () => {
  if (gameActive.value) return;
  score.value = 0;
  timeLeft.value = gameDuration;
  gameActive.value = true;
  moveTarget();

  gameTimer = setInterval(() => {
    timeLeft.value -= 1;
    if (timeLeft.value <= 0) {
      gameActive.value = false;
      if (gameTimer) clearInterval(gameTimer);
      gameTimer = undefined;
    }
  }, 1000);
};

const catchTarget = () => {
  if (!gameActive.value) return;
  score.value += 1;
  moveTarget();
};

const updateBackToTopVisibility = () => {
  showBackToTop.value = window.scrollY > 400;
};

const scrollToTop = () => {
  window.scrollTo({ top: 0, behavior: 'smooth' });
};

onMounted(() => {
  updateBackToTopVisibility();
  window.addEventListener('scroll', updateBackToTopVisibility, { passive: true });
});

onBeforeUnmount(() => {
  window.removeEventListener('scroll', updateBackToTopVisibility);
  if (gameTimer) clearInterval(gameTimer);
});

const socialLinks = [
  {
    href: 'https://github.com/lorenzguangco04',
    icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-8"><path d="M12.001 2C6.47598 2 2.00098 6.475 2.00098 12C2.00098 16.425 4.86348 20.1625 8.83848 21.4875C9.33848 21.575 9.52598 21.275 9.52598 21.0125C9.52598 20.775 9.51348 19.9875 9.51348 19.15C7.00098 19.6125 6.35098 18.5375 6.15098 17.975C6.03848 17.6875 5.55098 16.8 5.12598 16.5625C4.77598 16.375 4.27598 15.9125 5.11348 15.9C5.90098 15.8875 6.46348 16.625 6.65098 16.925C7.55098 18.4375 8.98848 18.0125 9.56348 17.75C9.65098 17.1 9.91348 16.6625 10.201 16.4125C7.97598 16.1625 5.65098 15.3 5.65098 11.475C5.65098 10.3875 6.03848 9.4875 6.67598 8.7875C6.57598 8.5375 6.22598 7.5125 6.77598 6.1375C6.77598 6.1375 7.61348 5.875 9.52598 7.1625C10.326 6.9375 11.176 6.825 12.026 6.825C12.876 6.825 13.726 6.9375 14.526 7.1625C16.4385 5.8625 17.276 6.1375 17.276 6.1375C17.826 7.5125 17.476 8.5375 17.376 8.7875C18.0135 9.4875 18.401 10.375 18.401 11.475C18.401 15.3125 16.0635 16.1625 13.8385 16.4125C14.201 16.725 14.5135 17.325 14.5135 18.2625C14.5135 19.6 14.501 20.675 14.501 21.0125C14.501 21.275 14.6885 21.5875 15.1885 21.4875C19.259 20.1133 21.9999 16.2963 22.001 12C22.001 6.475 17.526 2 12.001 2Z"></path></svg>',
    label: 'GitHub',
  },
  {
    href: 'https://www.facebook.com/Misstokwa30',
    icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M13.5 21v-8.2h2.75l.41-3.2H13.5V7.56c0-.93.26-1.56 1.59-1.56h1.69V3.14C16.49 3.05 15.51 3 14.37 3c-2.39 0-4.03 1.46-4.03 4.14V9.6H7.63v3.2h2.71V21h3.16Z" /></svg>',
    label: 'Facebook',
  },
  {
    href: 'mailto:teddyguangco1@gmail.com',
    icon: '<svg xmlns="http://www.w3.org/2000/svg" width="2.1em" height="2.1em" viewBox="0 0 24 24"><path fill="currentColor" d="m18.73 5.41l-1.28 1L12 10.46L6.55 6.37l-1.28-1A2 2 0 0 0 2 7.05v11.59A1.36 1.36 0 0 0 3.36 20h3.19v-7.72L12 16.37l5.45-4.09V20h3.19A1.36 1.36 0 0 0 22 18.64V7.05a2 2 0 0 0-3.27-1.64"></path></svg>',
    label: 'Email',
  },
];

const stackItems = [
  { desc: 'Built with', name: 'Vue', icon: `${baseUrl}svg/vue.svg`, alt: 'Vue Logo' },
  { desc: 'Styled with', name: 'CSS', icon: `${baseUrl}svg/CSS3.svg`, alt: 'CSS logo' },
  { desc: 'Deployed on', name: 'Vercel', icon: `${baseUrl}svg/vercel.svg`, alt: 'Vercel Logo' },
];
</script>

<template>
  <footer class="site-footer">
    <div class="footer-wrap">
      <div class="footer-grid">
        <div class="social-column">
          <div class="social-links">
            <a v-for="link in socialLinks" :key="link.label" :href="link.href" target="_blank" :aria-label="link.label" class="social-link" v-html="link.icon" />
          </div>
        </div>

        <div class="stack-column">
          <div class="stack-list">
            <div v-for="item in stackItems" :key="item.name" class="stack-row">
              <span>{{ item.desc }}</span>
              <img :src="item.icon" :alt="item.alt" />
              <span>{{ item.name }}</span>
            </div>
          </div>
        </div>

        <div class="game-column">
          <div class="mini-game">
            <div class="game-heading">
              <h2>Catch the target</h2>
              <span v-if="gameActive">{{ timeLeft }}s</span>
              <span v-else>{{ score }} points</span>
            </div>
            <div class="game-arena" :class="{ 'game-arena-active': gameActive }">
              <button
                v-if="gameActive"
                class="game-target"
                type="button"
                aria-label="Catch the target"
                :style="{ left: `${targetPosition.left}%`, top: `${targetPosition.top}%` }"
                @click="catchTarget"
              >
                +
              </button>
              <span v-else class="game-prompt">
                {{ score ? `Time's up! Score: ${score}` : 'Tap as many targets as you can!' }}
              </span>
            </div>
            <button class="game-start" type="button" :disabled="gameActive" @click="startGame">
              {{ gameActive ? 'Playing…' : score ? 'Play again' : 'Start game' }}
            </button>
          </div>
        </div>
      </div>

      <div class="copyright">
        <p>
          Copyright © {{ currentYear }} Teddy Guangco. All rights reserved.
        </p>
      </div>
    </div>
    <button
      v-if="showBackToTop"
      class="back-to-top"
      type="button"
      aria-label="Back to top"
      @click="scrollToTop"
    >
      <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
        <path d="m6 14 6-6 6 6" />
      </svg>
    </button>
  </footer>
</template>

<style scoped>
.site-footer {
  width: 100%;
  padding: 1.5rem 0 0.75rem;
  border-top: 1px solid rgba(255,255,255,0.06);
}

.footer-wrap {
  max-width: 80rem;
  margin: 0 auto;
  padding: 0 1rem;
}

.footer-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.25rem;
}

.social-links {
  display: flex;
  gap: 1rem;
  justify-content: center;
  align-items: center;
}

.social-link {
  display: inline-flex;
  color: var(--white-icon);
  transition: color 0.3s ease;
}

.social-link:hover {
  color: var(--white);
}

.social-link :deep(svg) {
  width: 2rem;
  height: 2rem;
}

.stack-list {
  display: grid;
  gap: 0.5rem;
  justify-content: center;
}

.stack-row {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  color: var(--white-icon);
  font-size: 0.875rem;
}

.stack-row img {
  width: 1.25rem;
  height: 1.25rem;
  object-fit: contain;
  filter: brightness(0) invert(1);
  opacity: 0.5;
}

.mini-game {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid var(--white-icon-tr);
  border-radius: 0.85rem;
  background: rgba(255, 255, 255, 0.03);
}

.game-heading {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 0.75rem;
  margin-bottom: 0.5rem;
  color: var(--white-icon);
  font-size: 0.8rem;
}

.game-heading h2 {
  margin: 0;
  color: var(--white);
  font-size: 0.95rem;
}

.game-arena {
  position: relative;
  display: flex;
  min-height: 5rem;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  border: 1px solid rgba(103, 232, 249, 0.14);
  border-radius: 0.65rem;
  background:
    linear-gradient(rgba(100, 180, 255, 0.035) 1px, transparent 1px),
    linear-gradient(90deg, rgba(100, 180, 255, 0.035) 1px, transparent 1px),
    rgba(7, 17, 31, 0.55);
  background-size: 1.25rem 1.25rem;
}

.game-prompt {
  padding: 0 0.75rem;
  color: var(--white-icon);
  font-size: 0.8rem;
  text-align: center;
}

.game-target {
  position: absolute;
  display: grid;
  width: 2rem;
  height: 2rem;
  place-items: center;
  transform: translate(-50%, -50%);
  border: 1px solid rgba(103, 232, 249, 0.7);
  border-radius: 50%;
  background: var(--accent-blue);
  box-shadow: 0 0 1rem rgba(56, 189, 248, 0.55);
  color: #04111f;
  font-size: 1.25rem;
  font-weight: 700;
  cursor: pointer;
}

.game-start {
  width: 100%;
  margin-top: 0.5rem;
  padding: 0.45rem 0.75rem;
  border: 1px solid rgba(103, 232, 249, 0.3);
  border-radius: 0.55rem;
  background: rgba(56, 189, 248, 0.1);
  color: var(--white);
  cursor: pointer;
}

.game-start:disabled {
  cursor: default;
  opacity: 0.65;
}

.copyright {
  border-top: 1px solid rgba(255,255,255,0.06);
  margin-top: 1.5rem;
  padding-top: 1rem;
  text-align: center;
  color: var(--white-icon);
  font-size: 0.875rem;
}

.copyright a {
  color: var(--white-icon);
}

.copyright a:hover {
  color: var(--white);
}

.back-to-top {
  position: fixed;
  z-index: 90;
  right: 1rem;
  bottom: 5.5rem;
  display: grid;
  width: 2.75rem;
  height: 2.75rem;
  place-items: center;
  border: 1px solid rgba(103, 232, 249, 0.35);
  border-radius: 50%;
  background: var(--component-bg);
  color: var(--accent-cyan);
  box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.25);
  cursor: pointer;
  backdrop-filter: blur(12px);
}

.back-to-top:hover {
  background: rgba(56, 189, 248, 0.18);
}

.back-to-top svg {
  width: 1.25rem;
  height: 1.25rem;
  stroke: currentColor;
  stroke-linecap: round;
  stroke-linejoin: round;
  stroke-width: 2;
}

@media (min-width: 768px) {
  .footer-grid {
    grid-template-columns: 1fr 1fr 1fr;
    align-items: center;
  }

  .back-to-top {
    right: 1.5rem;
    bottom: 1.5rem;
  }
}
</style>
