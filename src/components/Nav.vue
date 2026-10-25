<script setup lang="ts">
import { onMounted, ref } from 'vue';
import logoUrl from '../selfimg/dev_tedslogo.svg';

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
  if (window.scrollY > 0) {
    nav.value.classList.add('scrolling');
    const maxScroll = 1000;
    const scrollProgress = Math.min(window.scrollY / maxScroll, 1);
    const easeProgress = 1 - Math.pow(1 - scrollProgress, 4);
    const minWidth = 528;
    const maxWidth = window.innerWidth * 0.8;
    const currentWidth = maxWidth - (maxWidth - minWidth) * easeProgress;
    if (window.innerWidth >= 768) {
      nav.value.style.width = `${currentWidth}px`;
    }
  } else {
    nav.value.classList.remove('scrolling');
    nav.value.style.width = '80%';
  }
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

  window.addEventListener('scroll', () => {
    setActiveByScroll();
    handleNavResize();
  });

  window.addEventListener('resize', handleNavResize);
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
  bottom: 0;
  transform: translateX(-50%);
  z-index: 100;
  width: 80%;
  background: var(--background);
  border: 1px solid transparent;
  backdrop-filter: blur(20px);
  transition: background-color 0.3s ease, border-radius 0.3s ease, border-color 0.3s ease, width 0.3s ease;
}

.main-nav.scrolling {
  background: var(--component-bg);
  border-color: rgba(255, 255, 255, 0.1);
  border-radius: 9999px;
}

.nav-inner {
  position: relative;
  margin: 0 auto;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0.75rem;
}

.nav-brand {
  display: none;
}

.nav-list {
  list-style: none;
  display: flex;
  width: 100%;
  justify-content: space-between;
  gap: 1.5rem;
  padding: 0;
  margin: 0;
}

.nav-item {
  flex: 1;
}

.nav-link {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.25rem;
  color: var(--white-icon);
  font-size: 0.75rem;
  transition: color 0.3s ease;
}

.nav-link.active {
  color: white !important;
}

.nav-link.active .nav-indicator {
  transform: translateY(-50%) scale(1);
  opacity: 1;
}

.nav-indicator {
  position: absolute;
  left: -1.5rem;
  top: 50%;
  width: 0.5rem;
  height: 0.5rem;
  border-radius: 9999px;
  background: var(--accent-cyan);
  transform: translateY(-50%) scale(0);
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
}

@media (min-width: 768px) {
  .main-nav {
    top: 1.5rem;
    bottom: auto;
    width: 80%;
    border-radius: 0;
  }

  .nav-list {
    justify-content: center;
    gap: 3rem;
  }

  .nav-brand {
    position: absolute;
    left: 1.25rem;
    display: flex;
    width: 4.5rem;
    height: 2.5rem;
    align-items: center;
  }

  .nav-brand img {
    display: block;
    width: 100%;
    max-height: 100%;
    object-fit: contain;
  }

  .nav-item {
    flex: none;
  }

  .nav-link {
    font-size: 1rem;
  }
}
</style>
