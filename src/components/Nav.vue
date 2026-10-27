<script setup lang="ts">
import { onBeforeUnmount, onMounted, ref } from 'vue';
import logoUrl from '../selfimg/dev_tedslogo.svg';

const resumeUrl = `${import.meta.env.BASE_URL}Teddy-Guangco-CV.pdf`;

type NavItem = {
  label: string;
  href: string;
  icon: string;
};

const navItems: NavItem[] = [
  {
    label: 'Home',
    href: '#home',
    icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path d="M21 20C21 20.5523 20.5523 21 20 21H4C3.44772 21 3 20.5523 3 20V9.48907C3 9.18048 3.14247 8.88917 3.38606 8.69972L11.3861 2.47749C11.7472 2.19663 12.2528 2.19663 12.6139 2.47749L20.6139 8.69972C20.8575 8.88917 21 9.18048 21 9.48907V20ZM19 19V9.97815L12 4.53371L5 9.97815V19H19Z"></path></svg>',
  },
  {
    label: 'About',
    href: '#about',
    icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path d="M12 2a10 10 0 1 0 0 20 10 10 0 0 0 0-20Zm0 4a3 3 0 1 1 0 6 3 3 0 0 1 0-6Zm0 14a7.96 7.96 0 0 1-5.65-2.35C6.38 15.8 9.03 14 12 14s5.62 1.8 5.65 3.65A7.96 7.96 0 0 1 12 20Z"></path></svg>',
  },
  {
    label: 'Projects',
    href: '#projects',
    icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path d="M4 5V19H20V7H11.5858L9.58579 5H4ZM12.4142 5H21C21.5523 5 22 5.44772 22 6V20C22 20.5523 21.5523 21 21 21H3C2.44772 21 2 20.5523 2 20V4C2 3.44772 2.44772 3 3 3H10.4142L12.4142 5Z"></path></svg>',
  },
  {
    label: 'Contact',
    href: '#contact',
    icon: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path d="M21.7267 2.95694L16.2734 22.0432C16.1225 22.5716 15.7979 22.5956 15.5563 22.1126L11 13L1.9229 9.36919C1.41322 9.16532 1.41953 8.86022 1.95695 8.68108L21.0432 2.31901C21.5716 2.14285 21.8747 2.43866 21.7267 2.95694ZM19.0353 5.09647L6.81221 9.17085L12.4488 11.4255L15.4895 17.5068L19.0353 5.09647Z"></path></svg>',
  },
];

const nav = ref<HTMLElement | null>(null);
const activeId = ref('home');

const setActiveByScroll = () => {
  const sections = document.querySelectorAll<HTMLElement>('section[id]');
  let currentSection = 'home';

  sections.forEach((section) => {
    const rect = section.getBoundingClientRect();
    if (rect.top <= window.innerHeight * 0.4) {
      currentSection = section.id;
    }
  });

  activeId.value = currentSection;
};

const handleNavResize = () => {
  if (!nav.value) return;
  nav.value.style.removeProperty('width');
  nav.value.classList.toggle('scrolling', window.scrollY > 0);
};

const handleWindowScroll = () => {
  setActiveByScroll();
  handleNavResize();
};

const scrollToSection = (href: string) => {
  const id = href.replace('#', '');
  const el = document.getElementById(id);
  if (el) {
    el.scrollIntoView({ behavior: 'smooth' });
  }
};

onMounted(() => {
  setActiveByScroll();
  handleNavResize();

  window.addEventListener('scroll', handleWindowScroll, { passive: true });
  window.addEventListener('resize', handleNavResize);
});

onBeforeUnmount(() => {
  window.removeEventListener('scroll', handleWindowScroll);
  window.removeEventListener('resize', handleNavResize);
});
</script>

<template>
  <div class="nav-shell">
    <nav id="main-nav" ref="nav" class="main-nav">
      <div class="nav-inner">
        <a class="nav-brand" href="#home" aria-label="Teddy Guangco — Home" @click.prevent="scrollToSection('#home')">
          <img :src="logoUrl" alt="Teddy Guangco logo" />
        </a>
        <ul class="nav-list">
          <li v-for="item in navItems" :key="item.href" class="nav-item">
            <a
              :href="item.href"
              :class="{ active: activeId === item.href.replace('#', '') }"
              @click.prevent="scrollToSection(item.href)"
              class="nav-link"
            >
              <span class="nav-indicator" />
              <span class="nav-icon" v-html="item.icon" />
              <span class="nav-label">{{ item.label }}</span>
            </a>
          </li>
          <li class="nav-item">
            <a
              class="nav-link cv-nav-link"
              :href="resumeUrl"
              download="Teddy-Guangco-CV.pdf"
              aria-label="Download Teddy Guangco's CV"
            >
              <span class="nav-icon" aria-hidden="true">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor">
                  <path d="M12 3a1 1 0 0 1 1 1v9.59l3.3-3.3a1 1 0 1 1 1.4 1.42l-5 5a1 1 0 0 1-1.4 0l-5-5a1 1 0 0 1 1.4-1.42l3.3 3.3V4a1 1 0 0 1 1-1ZM5 19a1 1 0 0 1 1 1v1h12v-1a1 1 0 1 1 2 0v2a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-2a1 1 0 0 1 1-1Z" />
                </svg>
              </span>
              <span class="nav-label cv-label-mobile">CV</span>
              <span class="nav-label cv-label-desktop">Download CV</span>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</template>

<style scoped>
.nav-shell {
  display: flex;
  justify-content: center;
  width: 100%;
}

.main-nav {
  position: fixed;
  left: 50%;
  top: 1rem;
  bottom: auto;
  transform: translateX(-50%);
  z-index: 100;
  width: min(94vw, 1160px);
  max-width: 1160px;
  background: rgba(8, 21, 36, 0.82);
  border: 1px solid rgba(148, 190, 230, 0.18);
  border-radius: 1.3rem;
  backdrop-filter: blur(18px);
  box-shadow: 0 18px 40px rgba(2, 8, 17, 0.22);
  transition: background-color 0.3s ease, border-radius 0.3s ease, border-color 0.3s ease, width 0.3s ease,
    transform 0.3s ease;
  animation: nav-enter 0.65s cubic-bezier(0.2, 0.8, 0.2, 1) both;
}

.main-nav.scrolling {
  background: rgba(8, 21, 36, 0.92);
  border-color: rgba(148, 190, 230, 0.22);
}

.nav-inner {
  display: grid;
  grid-template-columns: minmax(5rem, 5.5rem) minmax(0, 1fr);
  align-items: center;
  width: 100%;
  margin: 0 auto;
  padding: 0.55rem 0.7rem;
}

.nav-brand {
  display: none;
}

.nav-list {
  list-style: none;
  display: flex;
  min-width: 0;
  align-items: center;
  justify-content: space-between;
  gap: clamp(0.35rem, 1vw, 1rem);
  padding: 0;
  margin: 0;
}

.nav-item {
  flex: 0 0 auto;
  min-width: 0;
  animation: nav-item-enter 0.45s ease both;
}

.nav-item:nth-child(1) {
  animation-delay: 0.12s;
}

.nav-item:nth-child(2) {
  animation-delay: 0.18s;
}

.nav-item:nth-child(3) {
  animation-delay: 0.24s;
}

.nav-item:nth-child(4) {
  animation-delay: 0.3s;
}

.nav-item:nth-child(5) {
  animation-delay: 0.36s;
}

.nav-item:last-child {
  margin-left: 0.25rem;
}

.nav-link {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 0.25rem;
  min-height: 2.8rem;
  padding: 0.25rem 0.5rem;
  color: var(--white-icon);
  font-size: 0.75rem;
  line-height: 1.1;
  transition: color 0.3s ease, transform 0.2s ease;
}

.nav-link:hover {
  color: #f4fbff;
  transform: translateY(-1px);
}

.nav-link.active {
  color: white !important;
}

.cv-nav-link {
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 0.4rem;
  min-height: 2.5rem;
  padding: 0.5rem 0.8rem;
  border: 1px solid rgba(207, 250, 254, 0.72);
  border-radius: 0.85rem;
  background: linear-gradient(135deg, #67e8f9, #38bdf8);
  color: #07111f;
  font-weight: 700;
  white-space: nowrap;
  box-shadow: 0 0.35rem 1rem rgba(56, 189, 248, 0.24), inset 0 1px rgba(255, 255, 255, 0.35);
  transition: background 0.2s ease, box-shadow 0.2s ease, transform 0.2s ease;
}

.cv-nav-link:hover {
  transform: translateY(-1px);
  background: linear-gradient(135deg, #a5f3fc, #67e8f9);
  box-shadow: 0 0.5rem 1.3rem rgba(56, 189, 248, 0.34), inset 0 1px rgba(255, 255, 255, 0.5);
}

.cv-nav-link:focus-visible {
  outline: 2px solid white;
  outline-offset: 3px;
}

.cv-nav-link .nav-icon {
  width: 1.2rem;
  height: 1.2rem;
}

.cv-nav-link .nav-icon :deep(svg) {
  width: 100%;
  height: 100%;
}

.nav-label.cv-label-desktop {
  display: none;
}

.nav-link.active .nav-indicator {
  transform: translateX(-50%) scale(1);
  opacity: 1;
}

.nav-indicator {
  position: absolute;
  left: 50%;
  top: -0.3rem;
  width: 0.5rem;
  height: 0.5rem;
  border-radius: 9999px;
  background: var(--accent-cyan);
  transform: translateX(-50%) scale(0);
  opacity: 0;
  transition: all 0.3s ease;
}

.nav-icon {
  display: flex;
  width: 1.5rem;
  height: 1.5rem;
  align-items: center;
  justify-content: center;
}

.nav-label {
  display: inline-block;
  white-space: nowrap;
}

@keyframes nav-enter {
  from {
    opacity: 0;
    transform: translate(-50%, -0.75rem) scale(0.98);
  }
  to {
    opacity: 1;
    transform: translate(-50%, 0) scale(1);
  }
}

@keyframes nav-item-enter {
  from {
    opacity: 0;
    transform: translateY(0.4rem);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@media (max-width: 767px) {
  .main-nav {
    position: fixed;
    left: 50%;
    bottom: calc(0.5rem + env(safe-area-inset-bottom));
    top: auto;
    transform: translateX(-50%);
    width: min(calc(100% - 1rem), 32rem);
    border-radius: 1.2rem;
  }

  .nav-list {
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr)) auto;
  width: 100%;
  align-items: center;
  justify-content: stretch;
  gap: clamp(0.35rem, 2vw, 0.75rem);
  }

  .nav-inner {
    display: flex;
    justify-content: center;
  }

  .nav-item {
    min-width: 0;
  }

  .nav-item:last-child {
    margin-left: 0;
  }

  .nav-link {
    width: 100%;
    min-width: 0;
    font-size: 0.68rem;
    padding: 0.1rem 0.1rem 0.2rem;
  }

  .cv-nav-link {
    gap: 0.2rem;
    padding: 0.45rem 0.55rem;
    min-width: 4.5rem;
  }

  .cv-label-mobile {
    display: inline-block;
    font-size: 0.65rem;
  }

  .nav-icon {
    width: 1.35rem;
    height: 1.35rem;
  }
}

@media (min-width: 768px) {
  .main-nav {
    top: 1.25rem;
    bottom: auto;
    width: min(94vw, 880px);
    border-radius: 1.2rem;
  }

  .nav-inner {
    padding: 0.7rem 1.1rem;
  }

  .nav-list {
    justify-content: space-between;
    gap: clamp(0.5rem, 1vw, 1rem);
    padding: 0;
  }

  .nav-item:last-child {
    margin-left: 0.25rem;
  }

  .nav-brand {
    display: flex;
    width: 5rem;
    height: 2.9rem;
    align-items: center;
    justify-content: center;
  }

  .nav-brand img {
    display: block;
    width: 100%;
    max-height: 100%;
    object-fit: contain;
    filter: drop-shadow(0 0 0.35rem rgba(103, 232, 249, 0.28));
  }

  .nav-item {
    flex: none;
  }

  .nav-link {
    min-height: 2.9rem;
    padding: 0.35rem 0.65rem;
    font-size: 0.96rem;
  }

  .nav-indicator {
    left: -1.5rem;
    top: 50%;
    transform: translateY(-50%) scale(0);
  }

  .nav-link.active .nav-indicator {
    transform: translateY(-50%) scale(1);
  }

  .cv-nav-link {
    min-width: 10rem;
    padding: 0.6rem 1rem;
  }

  .cv-nav-link .nav-icon {
    width: 1.25rem;
    height: 1.25rem;
  }

  .cv-label-mobile {
    display: none;
  }

  .nav-label.cv-label-desktop {
    display: inline-block;
  }
}

@media (prefers-reduced-motion: reduce) {
  .main-nav,
  .nav-item {
    animation: none;
  }
}
</style>
