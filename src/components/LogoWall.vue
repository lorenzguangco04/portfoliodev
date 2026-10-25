<script setup lang="ts">
const technologies = [
  { name: 'Vue', icon: '/svg/vue.svg' },
  { name: 'React', icon: '/svg/react.svg' },
  { name: 'Expo', badge: 'EX' },
  { name: 'React Native', icon: '/svg/react.svg' },
  { name: 'PHP', badge: 'PHP' },
  { name: 'TypeScript', icon: '/svg/typeScript.svg' },
  { name: 'Tailwind CSS', icon: '/svg/tailwindcss.svg' },
  { name: 'Next.js', icon: '/svg/next.svg' },
  { name: 'Node.js', icon: '/svg/nodejs.svg' },
  { name: 'HTML5', icon: '/svg/HTML5.svg' },
  { name: 'CSS3', icon: '/svg/CSS3.svg' },
  { name: 'JavaScript', icon: '/svg/javaScript.svg' },
  { name: 'Git', icon: '/svg/git.svg' },
  { name: 'MySQL', icon: '/svg/mysql.svg' },
];
</script>

<template>
  <div class="logo-wall">
    <div class="logo-track">
      <div v-for="(tech, index) in [...technologies, ...technologies]" :key="`${tech.name}-${index}`" class="logo-item" :aria-hidden="index >= technologies.length">
        <img v-if="tech.icon" :src="tech.icon" :alt="`${tech.name} logo`" width="30" height="30" loading="lazy" />
        <span v-else class="tech-badge" aria-hidden="true">{{ tech.badge }}</span>
        <span>{{ tech.name }}</span>
      </div>
    </div>
  </div>
</template>

<style scoped>
.logo-wall {
  position: relative;
  overflow: hidden;
  padding: 2rem 0;
}

.logo-wall::before,
.logo-wall::after {
  content: '';
  position: absolute;
  inset: 0 auto 0 0;
  width: 8rem;
  background: linear-gradient(to right, var(--background), transparent);
  z-index: 1;
  pointer-events: none;
}

.logo-wall::after {
  left: auto;
  right: 0;
  background: linear-gradient(to left, var(--background), transparent);
}

.logo-track {
  display: flex;
  width: max-content;
  will-change: transform;
  animation: scroll 60s linear infinite;
}

.logo-item {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding-right: 3rem;
  color: var(--white-icon);
  opacity: 0.7;
  transition: transform 0.3s ease;
}

.logo-item:hover {
  transform: scale(1.05);
}

.logo-item img {
  width: 1.75rem;
  height: 1.75rem;
  object-fit: contain;
  opacity: 0.6;
}

.tech-badge {
  display: inline-flex;
  width: 1.75rem;
  height: 1.75rem;
  flex: 0 0 1.75rem;
  align-items: center;
  justify-content: center;
  border: 1px solid rgba(103, 183, 231, 0.3);
  border-radius: 0.4rem;
  background: rgba(32, 79, 118, 0.32);
  color: var(--accent-cyan);
  font-size: 0.55rem;
  font-weight: 800;
  letter-spacing: -0.03em;
}

.logo-item span {
  white-space: nowrap;
  font-size: 1.125rem;
  font-weight: 500;
}

@keyframes scroll {
  0% {
    transform: translate3d(0, 0, 0);
  }
  100% {
    transform: translate3d(-50%, 0, 0);
  }
}

@media (min-width: 768px) {
  .logo-track {
    animation-duration: 50s;
  }
}
</style>
