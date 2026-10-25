<script setup lang="ts">
import { ref } from 'vue';

const form = ref({ name: '', email: '', message: '' });
const formSubmitted = ref(false);

const submitForm = async () => {
  formSubmitted.value = true;
};
</script>

<template>
  <section id="contact" class="contact-section">
    <div class="contact-wrap">
      <h2 class="eyebrow shiny-sec">Let's talk</h2>
      <h3>Let's Work Together</h3>
      <p class="contact-intro">Have a project in mind? I'd love to hear from you.</p>

      <div class="contact-grid">
        <div class="contact-copy">
          <h4>Let's Talk</h4>
          <p>I'm always interested in hearing about new projects and opportunities. Feel free to reach out!</p>
          <a class="contact-detail" href="mailto:teddyguangco1@gmail.com">
            <span class="contact-detail-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none">
                <path d="M3 6.75A1.75 1.75 0 0 1 4.75 5h14.5A1.75 1.75 0 0 1 21 6.75v10.5A1.75 1.75 0 0 1 19.25 19H4.75A1.75 1.75 0 0 1 3 17.25V6.75Z" />
                <path d="m4 6 8 6 8-6" />
              </svg>
            </span>
            <span>
              <strong>Email</strong>
              <span class="contact-detail-value">teddyguangco1@gmail.com</span>
            </span>
          </a>
          <div class="location-row">
            <span class="contact-detail-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none">
                <path d="M19 10c0 5-7 11-7 11S5 15 5 10a7 7 0 1 1 14 0Z" />
                <circle cx="12" cy="10" r="2.5" />
              </svg>
            </span>
            <span>
              <strong>Location</strong>
              <span class="location-value">Bayanihan, Gapan City, Nueva Ecija</span>
            </span>
          </div>
          <a
            class="social-link"
            href="https://www.facebook.com/Misstokwa30"
            aria-label="Facebook"
            target="_blank"
            rel="noopener noreferrer"
          >
            <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
              <path d="M13.5 21v-8.2h2.75l.41-3.2H13.5V7.56c0-.93.26-1.56 1.59-1.56h1.69V3.14C16.49 3.05 15.51 3 14.37 3c-2.39 0-4.03 1.46-4.03 4.14V9.6H7.63v3.2h2.71V21h3.16Z" />
            </svg>
            <span>Teddy Guangco</span>
          </a>
        </div>

        <div class="form-panel">
          <form v-if="!formSubmitted" class="contact-form" @submit.prevent="submitForm">
            <input v-model="form.name" type="text" name="from_name" placeholder="Name" required />
            <input v-model="form.email" type="email" name="reply_to" placeholder="Email" required />
            <textarea v-model="form.message" name="message" rows="6" placeholder="Message" required />
            <button type="submit">Submit</button>
          </form>
          <div v-else class="success-message">✅ Thank you for your message!</div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.contact-section {
  position: relative;
  isolation: isolate;
  overflow: hidden;
  width: 100%;
  padding: 3rem 0;
  border-top: 1px solid rgba(255,255,255,0.06);
  background: radial-gradient(ellipse at 82% 35%, rgba(14, 116, 190, 0.1), transparent 48%);
}

.contact-section::before {
  position: absolute;
  z-index: -1;
  inset: 0;
  background:
    linear-gradient(rgba(100, 180, 255, 0.045) 1px, transparent 1px),
    linear-gradient(90deg, rgba(100, 180, 255, 0.045) 1px, transparent 1px);
  background-size: 44px 44px;
  animation: grid-drift 18s linear infinite;
  content: '';
  pointer-events: none;
}

.contact-wrap {
  max-width: 80rem;
  margin: 0 auto;
  padding: 0 1rem;
  text-align: center;
}

.eyebrow {
  margin: 0 0 0.5rem;
  font-size: 1.125rem;
}

h3 {
  margin: 0 0 0.5rem;
  color: var(--white);
  font-size: clamp(2rem, 5vw, 3rem);
  font-weight: 700;
}

.contact-intro {
  margin: 0 0 2.5rem;
  color: var(--white-icon);
}

.contact-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 2rem;
}

.contact-copy {
  color: var(--white-icon);
  text-align: left;
}

.contact-copy h4 {
  margin: 0 0 0.75rem;
  color: var(--white);
  font-size: 1.35rem;
}

.contact-copy p {
  margin: 0 0 1.5rem;
  line-height: 1.6;
}

.contact-detail {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  width: fit-content;
  margin-bottom: 1rem;
}

.contact-detail strong,
.location-row strong {
  display: block;
  margin-bottom: 0.2rem;
  color: var(--white);
}

.contact-detail-value {
  color: var(--accent-cyan);
}

.location-row {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  margin-bottom: 1.5rem;
}

.contact-detail-icon {
  display: flex;
  flex: 0 0 2.75rem;
  width: 2.75rem;
  height: 2.75rem;
  align-items: center;
  justify-content: center;
  border: 1px solid rgba(56, 189, 248, 0.35);
  border-radius: 0.65rem;
  background: rgba(56, 189, 248, 0.08);
  color: var(--accent-cyan);
}

.contact-detail-icon svg {
  width: 1.3rem;
  height: 1.3rem;
  stroke: currentColor;
  stroke-linecap: round;
  stroke-linejoin: round;
  stroke-width: 1.7;
}

.location-value {
  color: var(--white-icon);
}

.social-link {
  display: inline-flex;
  min-height: 2.75rem;
  height: 2.75rem;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  padding: 0 0.75rem;
  border: 1px solid var(--white-icon-tr);
  border-radius: 0.65rem;
  background: rgba(255, 255, 255, 0.04);
  color: var(--white-icon);
  transition: color 0.2s ease, background-color 0.2s ease, border-color 0.2s ease;
}

.social-link:hover {
  border-color: var(--accent-cyan);
  background: rgba(56, 189, 248, 0.12);
  color: var(--accent-cyan);
}

.social-link svg {
  width: 1.35rem;
  height: 1.35rem;
}

.contact-form {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.contact-form input,
.contact-form textarea {
  width: 100%;
  padding: 0.75rem 1rem;
  border-radius: 0.75rem;
  border: 1px solid var(--white-icon-tr);
  background: rgba(20,20,20,0.6);
  color: var(--white);
  outline: none;
}

.contact-form input:focus,
.contact-form textarea:focus {
  box-shadow: 0 0 0 2px var(--sec);
}

.contact-form textarea {
  resize: none;
}

.contact-form button {
  padding: 0.75rem 1rem;
  border: 1px solid var(--white-icon-tr);
  border-radius: 0.75rem;
  background: rgba(255,255,255,0.08);
  color: var(--white);
  opacity: 0.6;
  transition: all 0.3s ease;
  cursor: pointer;
}

.contact-form button:hover {
  opacity: 1;
  background: var(--white-icon-tr);
}

.success-message {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 1rem;
  color: var(--white);
  font-size: 1.125rem;
}

@media (min-width: 768px) {
  .contact-grid {
    grid-template-columns: repeat(2, minmax(0, 1fr));
    align-items: center;
    gap: clamp(2rem, 6vw, 5rem);
    text-align: left;
  }

  .form-panel {
    padding: 1.5rem;
    border: 1px solid var(--white-icon-tr);
    border-radius: 0.85rem;
    background: rgba(7, 17, 31, 0.45);
  }
}

@media (prefers-reduced-motion: reduce) {
  .contact-section::before {
    animation: none;
  }
}
</style>
