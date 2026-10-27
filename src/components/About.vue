<template>
  <section id="about" class="about-section" aria-labelledby="about-title">
    <div class="about-wrap">
      <div class="about-copy">
        <span class="about-eyebrow">A little about me</span>
        <h2 id="about-title">Curious by nature.<br /><span>Practical by design.</span></h2>
        <p class="about-intro">
          I’m Teddy Guangco, a Full-Stack Developer and IT student who enjoys
          turning ideas into practical, user-friendly web experiences.
        </p>
        <p class="about-detail">
          I like working across the stack, learning through hands-on projects,
          and paying attention to the details that make an application feel
          clear and easy to use.
        </p>
        <div class="about-actions">
          <a class="about-button primary-button" href="#projects">Explore my work <span aria-hidden="true">→</span></a>
          <a class="about-button secondary-button" href="#contact">Get in touch</a>
        </div>
      </div>

      <aside class="about-card" aria-label="What matters in my work">
        <span class="card-mark" aria-hidden="true">TG</span>
        <p class="card-label">What matters in my work</p>
        <ul>
          <li><span aria-hidden="true">01</span><div><strong>Useful solutions</strong><small>Start with a real need and build with purpose.</small></div></li>
          <li><span aria-hidden="true">02</span><div><strong>Thoughtful experiences</strong><small>Keep interfaces clear, friendly, and easy to use.</small></div></li>
          <li><span aria-hidden="true">03</span><div><strong>Continuous learning</strong><small>Grow through curiosity, practice, and collaboration.</small></div></li>
        </ul>
      </aside>
    </div>
  </section>
</template>

<style scoped>
.about-section {
  position: relative;
  overflow: hidden;
  padding: 5rem 1rem;
  color: var(--white);
  background: radial-gradient(ellipse at 14% 50%, rgba(14, 116, 190, 0.15), transparent 48%);
}

.about-wrap {
  display: grid;
  grid-template-columns: 1fr;
  gap: 2.5rem;
  width: min(100%, 72rem);
  margin: 0 auto;
}

.about-copy {
  max-width: 42rem;
}

.about-eyebrow,
.card-label {
  color: var(--accent-cyan);
  font-size: 0.78rem;
  font-weight: 700;
  letter-spacing: 0.14em;
  text-transform: uppercase;
}

h2 {
  margin: 0.8rem 0 1.25rem;
  font-size: clamp(2.25rem, 6vw, 4rem);
  line-height: 1.08;
  letter-spacing: -0.045em;
}

h2 span {
  color: var(--accent-blue);
}

.about-intro,
.about-detail {
  max-width: 39rem;
  color: var(--white-icon);
  font-size: clamp(1rem, 2vw, 1.15rem);
  line-height: 1.8;
}

.about-intro {
  color: var(--white);
}

.about-actions {
  display: flex;
  flex-wrap: wrap;
  gap: 0.8rem;
  margin-top: 1.75rem;
}

.about-button {
  display: inline-flex;
  min-height: 2.9rem;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  padding: 0.75rem 1.1rem;
  border: 1px solid var(--white-icon-tr);
  border-radius: 999px;
  font-weight: 650;
  transition: transform 0.2s ease, background-color 0.2s ease, border-color 0.2s ease;
}

.about-button:hover {
  transform: translateY(-2px);
}

.primary-button {
  border-color: transparent;
  background: linear-gradient(135deg, #67e8f9, #38bdf8);
  color: #07111f;
}

.secondary-button {
  background: rgba(10, 25, 43, 0.65);
  color: var(--white);
}

.secondary-button:hover {
  border-color: rgba(103, 232, 249, 0.5);
  background: var(--component-bg);
}

.about-button:focus-visible {
  outline: 2px solid var(--accent-cyan);
  outline-offset: 3px;
}

.about-card {
  position: relative;
  align-self: center;
  overflow: hidden;
  padding: 1.5rem;
  border: 1px solid var(--white-icon-tr);
  border-radius: 1.5rem;
  background: linear-gradient(145deg, rgba(10, 25, 43, 0.92), rgba(8, 21, 36, 0.8));
  box-shadow: 0 1.5rem 4rem rgba(0, 0, 0, 0.2);
}

.card-mark {
  position: absolute;
  top: -1.5rem;
  right: 0.5rem;
  color: rgba(103, 232, 249, 0.08);
  font-size: 8rem;
  font-weight: 800;
  letter-spacing: -0.12em;
  pointer-events: none;
}

.card-label {
  position: relative;
  margin: 0 0 1.25rem;
}

.about-card ul {
  position: relative;
  display: grid;
  gap: 1.2rem;
  margin: 0;
  padding: 0;
  list-style: none;
}

.about-card li {
  display: flex;
  gap: 1rem;
  align-items: flex-start;
}

.about-card li > span {
  color: var(--accent-cyan);
  font-size: 0.78rem;
  font-weight: 700;
}

.about-card li div {
  display: grid;
  gap: 0.3rem;
}

.about-card strong {
  color: var(--white);
  font-size: 1rem;
}

.about-card small {
  color: var(--white-icon);
  font-size: 0.9rem;
  line-height: 1.55;
}

@media (min-width: 800px) {
  .about-section {
    padding: 7rem 2rem;
  }

  .about-wrap {
    grid-template-columns: 1.15fr 0.85fr;
    align-items: center;
    gap: 4rem;
  }

  .about-card {
    padding: 2rem;
  }
}
</style>
