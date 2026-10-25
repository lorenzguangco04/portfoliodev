<script setup lang="ts">
import RainBackground from './RainBackground.vue';
import LogoWall from './LogoWall.vue';
import SkillsList from './SkillsList.vue';

const socialLinks = [
  {
    href: 'https://github.com/lorenzguangco04',
    label: 'GitHub',
    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-8"><path d="M12.001 2C6.47598 2 2.00098 6.475 2.00098 12C2.00098 16.425 4.86348 20.1625 8.83848 21.4875C9.33848 21.575 9.52598 21.275 9.52598 21.0125C9.52598 20.775 9.51348 19.9875 9.51348 19.15C7.00098 19.6125 6.35098 18.5375 6.15098 17.975C6.03848 17.6875 5.55098 16.8 5.12598 16.5625C4.77598 16.375 4.27598 15.9125 5.11348 15.9C5.90098 15.8875 6.46348 16.625 6.65098 16.925C7.55098 18.4375 8.98848 18.0125 9.56348 17.75C9.65098 17.1 9.91348 16.6625 10.201 16.4125C7.97598 16.1625 5.65098 15.3 5.65098 11.475C5.65098 10.3875 6.03848 9.4875 6.67598 8.7875C6.57598 8.5375 6.22598 7.5125 6.77598 6.1375C6.77598 6.1375 7.61348 5.875 9.52598 7.1625C10.326 6.9375 11.176 6.825 12.026 6.825C12.876 6.825 13.726 6.9375 14.526 7.1625C16.4385 5.8625 17.276 6.1375 17.276 6.1375C17.826 7.5125 17.476 8.5375 17.376 8.7875C18.0135 9.4875 18.401 10.375 18.401 11.475C18.401 15.3125 16.0635 16.1625 13.8385 16.4125C14.201 16.725 14.5135 17.325 14.5135 18.2625C14.5135 19.6 14.501 20.675 14.501 21.0125C14.501 21.275 14.6885 21.5875 15.1885 21.4875C19.259 20.1133 21.9999 16.2963 22.001 12C22.001 6.475 17.526 2 12.001 2Z"></path></svg>`,
  },
  {
    href: 'mailto:teddyguangco1@gmail.com',
    label: 'Email',
    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="2.1em" height="2.1em" viewBox="0 0 24 24"><path fill="currentColor" d="m18.73 5.41l-1.28 1L12 10.46L6.55 6.37l-1.28-1A2 2 0 0 0 2 7.05v11.59A1.36 1.36 0 0 0 3.36 20h3.19v-7.72L12 16.37l5.45-4.09V20h3.19A1.36 1.36 0 0 0 22 18.64V7.05a2 2 0 0 0-3.27-1.64"></path></svg>`,
  },
];

</script>

<template>
  <section id="home" class="home-section">
    <RainBackground />
    <div class="content-wrap">
      <div class="hero-grid">
        <div class="intro-block">
          <span class="availability">
            <span class="availability-dot"></span>
            Open to opportunities
          </span>

          <div class="hero-copy">
            <h1>Hi, I'm <span>Teddy<br class="name-break" /> Guangco</span></h1>
            <h2>Full-Stack Developer &amp; IT Student</h2>
            <p>
              I build practical, user-friendly web experiences with modern
              technologies. I enjoy turning ideas into useful applications —
              let's create something great together.
            </p>
          </div>

          <div class="hero-actions">
            <a href="#projects" class="hero-button primary-button">
              View My Work <span aria-hidden="true">→</span>
            </a>
            <a href="#contact" class="hero-button secondary-button">Get In Touch</a>
          </div>

          <div class="hero-stats" aria-label="Portfolio highlights">
            <div class="stat">
              <strong>6</strong>
              <span>Certifications</span>
            </div>
            <div class="stat">
              <strong>6</strong>
              <span>Core Technologies</span>
            </div>
            <div class="stat">
              <strong>1</strong>
              <span>Deployed Project</span>
            </div>
          </div>

          <div class="social-list">
            <a
              v-for="link in socialLinks"
              :key="link.label"
              :href="link.href"
              :aria-label="link.label"
              target="_blank"
              rel="noopener noreferrer"
              class="social-link"
              v-html="link.icon"
            />
          </div>
        </div>

        <div class="portrait-frame">
          <img
            class="profile-photo"
            src="/images/teddy-guangco-transparent.png"
            alt="Portrait of Teddy Guangco"
            fetchpriority="high"
          />
          <span class="portrait-mode" aria-hidden="true">SHADOW MODE</span>
        </div>
      </div>

      <LogoWall />

      <div class="skills-layout">
        <SkillsList />
        <aside class="approach-card" aria-labelledby="approach-title">
          <span class="approach-eyebrow">A thoughtful process</span>
          <h2 id="approach-title">How I bring ideas to life</h2>
          <p class="approach-intro">
            I focus on making useful, easy-to-use experiences from the first sketch to the final details.
          </p>
          <ol class="approach-steps">
            <li>
              <span class="step-number">01</span>
              <span><strong>Understand</strong><small>Start with the people and the problem.</small></span>
            </li>
            <li>
              <span class="step-number">02</span>
              <span><strong>Build</strong><small>Turn the idea into a practical solution.</small></span>
            </li>
            <li>
              <span class="step-number">03</span>
              <span><strong>Refine</strong><small>Polish the details and make it feel right.</small></span>
            </li>
          </ol>
          <a class="approach-link" href="#projects">
            Explore my projects <span aria-hidden="true">→</span>
          </a>
        </aside>
      </div>
    </div>
  </section>
</template>

<style scoped>
.home-section {
  --hero-accent: #38bdf8;
  position: relative;
  isolation: isolate;
  overflow: hidden;
  color: var(--white);
  margin-top: 2rem;
  background: radial-gradient(ellipse at 76% 72%, rgba(14, 116, 190, 0.24), transparent 48%);
}

.home-section::before {
  position: absolute;
  z-index: -1;
  top: 10%;
  right: -15rem;
  width: 38rem;
  height: 38rem;
  border-radius: 50%;
  background: rgba(14, 116, 190, 0.17);
  content: '';
  filter: blur(100px);
}

.content-wrap {
  max-width: 80rem;
  margin: 0 auto;
  padding: 2rem 1rem 3.5rem;
}

.hero-grid {
  display: grid;
  grid-template-columns: 1fr;
  align-items: center;
  gap: 3rem;
}

.intro-block {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
  text-align: left;
}

.availability {
  display: inline-flex;
  align-items: center;
  gap: 0.55rem;
  width: fit-content;
  padding: 0.55rem 0.9rem;
  border: 1px solid rgba(66, 220, 133, 0.38);
  border-radius: 999px;
  background: rgba(15, 39, 27, 0.65);
  color: #73efa7;
  font-size: 0.9rem;
}

.availability-dot {
  width: 0.55rem;
  height: 0.55rem;
  border-radius: 50%;
  background: #39db7d;
  box-shadow: 0 0 12px rgba(57, 219, 125, 0.6);
}

.hero-copy h1 {
  margin: 0;
  color: var(--white);
  font-size: clamp(3.25rem, 7vw, 5rem);
  font-weight: 750;
  letter-spacing: -0.055em;
  line-height: 0.98;
}

.hero-copy h1 span {
  color: var(--hero-accent);
}

.name-break {
  display: none;
}

.hero-copy h2 {
  margin: 1.25rem 0 0;
  font-size: clamp(1.1rem, 2vw, 1.4rem);
  font-weight: 650;
}

.hero-copy p {
  max-width: 34rem;
  margin: 1rem 0 0;
  color: #b8b8c2;
  font-size: clamp(1rem, 1.4vw, 1.1rem);
  line-height: 1.55;
}

.hero-actions {
  display: flex;
  flex-wrap: wrap;
  gap: 0.75rem;
}

.hero-button {
  display: inline-flex;
  min-height: 2.9rem;
  align-items: center;
  justify-content: center;
  gap: 0.65rem;
  padding: 0.75rem 1.15rem;
  border: 1px solid transparent;
  border-radius: 0.65rem;
  color: white;
  font-size: 0.95rem;
  font-weight: 650;
  transition: transform 0.2s ease, background-color 0.2s ease, border-color 0.2s ease;
}

.hero-button:hover {
  transform: translateY(-2px);
}

.primary-button {
  background: var(--hero-accent);
  color: #04111f;
  box-shadow: 0 8px 24px rgba(56, 189, 248, 0.2);
}

.primary-button:hover {
  background: #67e8f9;
}

.primary-button span {
  font-size: 1.2rem;
}

.secondary-button {
  border-color: rgba(255, 255, 255, 0.16);
  background: rgba(255, 255, 255, 0.04);
}

.secondary-button:hover {
  border-color: rgba(255, 255, 255, 0.34);
  background: rgba(255, 255, 255, 0.08);
}

.hero-stats {
  display: flex;
  flex-wrap: wrap;
  gap: 1.5rem 2.5rem;
  padding-top: 1.25rem;
  border-top: 1px solid rgba(255, 255, 255, 0.12);
}

.stat {
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
}

.stat strong {
  color: var(--hero-accent);
  font-size: 1.8rem;
  line-height: 1;
}

.stat span {
  color: #b8b8c2;
  font-size: 0.8rem;
}

.portrait-frame {
  position: relative;
  width: min(100%, 25rem);
  aspect-ratio: 0.9;
  justify-self: center;
  isolation: isolate;
}

.portrait-frame::before,
.portrait-frame::after {
  position: absolute;
  top: 50%;
  left: 50%;
  aspect-ratio: 1;
  border-radius: 50%;
  content: '';
  pointer-events: none;
  transform: translate(-50%, -50%);
}

.portrait-frame::before {
  z-index: -1;
  width: 90%;
  border: 1px solid rgba(167, 139, 250, 0.58);
  box-shadow: inset 0 0 2rem rgba(99, 102, 241, 0.22), 0 0 1.5rem rgba(139, 92, 246, 0.24);
  opacity: 0;
  transition: opacity 0.4s ease, width 0.6s ease;
}

.portrait-frame::after {
  z-index: -1;
  width: 78%;
  background: radial-gradient(circle, rgba(99, 102, 241, 0.34), rgba(59, 130, 246, 0.12) 48%, transparent 72%);
  filter: blur(0.8rem);
  opacity: 0.5;
  transition: opacity 0.5s ease, width 0.6s ease;
}

.profile-photo {
  position: relative;
  z-index: 1;
  display: block;
  width: 92%;
  height: 100%;
  margin-inline: auto;
  object-fit: contain;
  object-position: center bottom;
  -webkit-mask-image: linear-gradient(to bottom, #000 0%, #000 91%, transparent 100%);
  mask-image: linear-gradient(to bottom, #000 0%, #000 91%, transparent 100%);
  filter: drop-shadow(0 1rem 1.5rem rgba(0, 0, 0, 0.3));
  animation: portrait-float 5s ease-in-out infinite;
  transition: transform 0.55s cubic-bezier(0.2, 0.8, 0.2, 1), filter 0.55s ease;
}

@keyframes portrait-float {
  0%,
  100% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-0.45rem);
  }
}

.portrait-frame:hover::before {
  width: 100%;
  opacity: 1;
  animation: shadow-orbit 12s linear infinite;
}

.portrait-frame:hover::after {
  width: 94%;
  opacity: 1;
}

.portrait-frame:hover .profile-photo {
  transform: translateY(-0.65rem) scale(1.035);
  filter: saturate(0.76) contrast(1.12)
    drop-shadow(0 0 1rem rgba(167, 139, 250, 0.95))
    drop-shadow(0 0 2.5rem rgba(79, 70, 229, 0.7));
  animation-play-state: paused;
}

@keyframes shadow-orbit {
  to {
    transform: translate(-50%, -50%) rotate(360deg);
  }
}

.portrait-mode {
  position: absolute;
  z-index: 2;
  bottom: 0.4rem;
  left: 50%;
  color: #c4b5fd;
  font-size: 0.7rem;
  font-weight: 750;
  letter-spacing: 0.24em;
  opacity: 0;
  pointer-events: none;
  text-shadow: 0 0 0.75rem rgba(167, 139, 250, 0.9);
  transform: translate(-50%, 0.5rem);
  transition: opacity 0.35s ease, transform 0.35s ease;
}

.portrait-frame:hover .portrait-mode {
  opacity: 1;
  transform: translate(-50%, 0);
}

.social-list {
  display: flex;
  justify-content: flex-start;
  gap: 0.75rem;
}

.social-link {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.6rem;
  border: 1px solid var(--white-icon-tr);
  border-radius: 0.65rem;
  background: rgba(20, 20, 20, 0.6);
  color: var(--white-icon);
  transition: all 0.3s ease;
}

.social-link:hover {
  color: white;
  background: var(--white-icon-tr);
}

.social-link :deep(svg) {
  width: 1.5rem;
  height: 1.5rem;
}

.skills-layout {
  display: grid;
  grid-template-columns: 1fr;
  align-items: center;
  gap: 2rem;
  margin-top: 2rem;
}

.approach-card {
  position: relative;
  overflow: hidden;
  padding: clamp(1.5rem, 3vw, 2.25rem);
  border: 1px solid rgba(103, 232, 249, 0.18);
  border-radius: 1.25rem;
  background: linear-gradient(145deg, rgba(10, 25, 43, 0.9), rgba(7, 17, 31, 0.82));
  box-shadow: 0 1.5rem 4rem rgba(0, 0, 0, 0.18);
}

.approach-card::after {
  position: absolute;
  top: -5rem;
  right: -5rem;
  width: 12rem;
  height: 12rem;
  border-radius: 50%;
  background: rgba(56, 189, 248, 0.1);
  content: '';
  filter: blur(2.5rem);
  pointer-events: none;
}

.approach-eyebrow {
  color: var(--accent-cyan);
  font-size: 0.75rem;
  font-weight: 700;
  letter-spacing: 0.12em;
  text-transform: uppercase;
}

.approach-card h2 {
  max-width: 24rem;
  margin: 0.75rem 0;
  color: var(--white);
  font-size: clamp(1.5rem, 3vw, 2rem);
  line-height: 1.15;
}

.approach-intro {
  max-width: 31rem;
  margin: 0;
  color: var(--white-icon);
  font-size: 0.95rem;
  line-height: 1.6;
}

.approach-steps {
  display: grid;
  gap: 1rem;
  margin: 1.5rem 0;
  padding: 0;
  list-style: none;
}

.approach-steps li {
  display: flex;
  align-items: flex-start;
  gap: 0.85rem;
}

.step-number {
  display: grid;
  flex: 0 0 2.25rem;
  width: 2.25rem;
  height: 2.25rem;
  place-items: center;
  border: 1px solid rgba(56, 189, 248, 0.25);
  border-radius: 0.65rem;
  background: rgba(56, 189, 248, 0.08);
  color: var(--accent-cyan);
  font-size: 0.75rem;
  font-weight: 700;
}

.approach-steps strong,
.approach-steps small {
  display: block;
}

.approach-steps strong {
  margin: 0.1rem 0 0.25rem;
  color: var(--white);
  font-size: 0.95rem;
}

.approach-steps small {
  color: var(--white-icon);
  font-size: 0.82rem;
  line-height: 1.5;
}

.approach-link {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  color: var(--accent-cyan);
  font-weight: 650;
}

.approach-link span {
  transition: transform 0.2s ease;
}

.approach-link:hover span {
  transform: translateX(0.25rem);
}

@media (min-width: 768px) {
  .home-section {
    margin-top: 0;
  }

  .content-wrap {
    padding-top: 7rem;
    padding-bottom: 2rem;
  }

  .hero-grid {
    grid-template-columns: minmax(0, 1.2fr) minmax(18rem, 0.8fr);
    gap: clamp(2rem, 7vw, 7rem);
  }

  .name-break {
    display: initial;
  }

  .portrait-frame {
    width: min(100%, 24rem);
    aspect-ratio: 0.92;
  }

  .skills-layout {
    grid-template-columns: minmax(0, 0.9fr) minmax(0, 1.1fr);
    gap: clamp(2rem, 6vw, 5rem);
  }

}

@media (max-width: 767px) {
  .intro-block {
    align-items: flex-start;
  }

  .hero-stats {
    width: 100%;
    justify-content: space-between;
    gap: 1rem;
  }

  .stat span {
    max-width: 6.5rem;
  }

  .portrait-frame {
    width: min(82%, 20rem);
    aspect-ratio: 1;
  }
}

@media (prefers-reduced-motion: reduce) {
  .profile-photo {
    animation: none;
    transition: none;
  }

  .portrait-frame::before,
  .portrait-frame::after,
  .portrait-mode {
    transition: none;
  }

  .portrait-frame:hover::before {
    animation: none;
  }

  .portrait-frame:hover .profile-photo {
    transform: none;
  }
}
</style>
