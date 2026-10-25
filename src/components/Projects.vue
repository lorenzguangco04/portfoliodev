<script setup lang="ts">
import { onBeforeUnmount, onMounted, ref } from 'vue';

type Project = {
  title: string;
  image: string;
  link: string | null;
  preview: string;
  status: string;
  description?: string;
  technologies?: string[];
};

const projects: Project[] = [
  {
    title: 'CIT Scheduler',
    image: '/project-images/cit-scheduler.png',
    link: null,
    preview: 'https://www.citscheduler.com/',
    status: 'Capstone Project',
    deployment: 'Deployed',
    description: 'A capstone scheduling platform for the College of Information Technology.',
    technologies: ['Node.js', 'Vue.js', 'Ionic', 'Capacitor', 'MongoDB Atlas', 'Render', 'Vercel', 'Hostinger'],
  },
];

const otherProjects = [
  {
    title: "Cinia's Inventory Management System",
    image: '/project-images/cinias-inventory.png',
    description:
      'Designed for personal or team use, with real-time updates, efficient stock tracking, image sharing, and collaborative chat with message reactions.',
    technologies: ['HTML', 'CSS', 'JavaScript', 'MySQL'],
    category: 'Inventory & collaboration',
    number: '02',
    deployment: 'Not Deployed',
  },
  {
    title: 'Gtourist - Travel',
    image: '/project-images/gtourist-travel.png',
    description:
      'A personal travel blog dedicated to showcasing hidden gems and popular tourist spots around Gapan City.',
    technologies: ['HTML', 'CSS', 'JavaScript', 'MySQL'],
    category: 'Travel & discovery',
    number: '03',
    deployment: 'Not Deployed',
  },
  {
    title: 'Public Health Information System',
    image: '/project-images/public-health-system.png',
    description:
      'A web-based platform for managing, sharing, and visualizing public health data, with real-time updates, secure data handling, and dashboards for health officials and communities.',
    technologies: ['HTML', 'CSS', 'JavaScript', 'MySQL'],
    category: 'Public health data',
    number: '04',
    deployment: 'Not Deployed',
  },
];

const certifications = [
  {
    title: 'Oracle Cloud Infrastructure Foundations',
    issuer: 'Oracle',
    year: '2025',
    document: new URL('../image/eCertificate.pdf', import.meta.url).href,
    description: 'Certified in Oracle Cloud Infrastructure fundamentals, including core services, networking, compute, storage, and security best practices.',
    skills: ['OCI', 'Cloud Computing', 'Networking', 'Security', 'IaC'],
  },
  {
    title: 'Oracle Database Administration',
    issuer: 'Oracle',
    year: '2025',
    document: new URL('../image/eCertificate (1).pdf', import.meta.url).href,
    description: 'Recognition of foundational knowledge in Oracle database administration and database operations.',
    skills: ['Oracle Database', 'SQL', 'Database Administration'],
  },
  {
    title: 'Oracle Cloud Data Management',
    issuer: 'Oracle',
    year: '2025',
    document: new URL('../image/eCertificate (2).pdf', import.meta.url).href,
    description: 'Recognition of skills in Oracle Cloud data management services and cloud data solutions.',
    skills: ['Oracle Cloud', 'Data Management', 'Cloud Services'],
  },
  {
    title: 'Oracle Cloud Networking Professional',
    issuer: 'Oracle',
    year: '2025',
    document: new URL('../image/eCertificate (3).pdf', import.meta.url).href,
    description: 'Recognition of professional-level knowledge of networking services and solutions in Oracle Cloud Infrastructure.',
    skills: ['OCI Networking', 'Cloud Infrastructure', 'Network Security'],
  },
  {
    title: 'Certificate of Achievement',
    issuer: 'Certificate',
    year: '2026',
    document: new URL('../image/certificate-208_NI__VI_12_2026-1792911663.pdf', import.meta.url).href,
    description: 'Certificate document provided in the project image folder.',
    skills: ['Achievement'],
  },
  {
    title: 'National Certificate II - Computer Systems Servicing',
    issuer: 'TESDA',
    year: '2023',
    document: new URL('../image/NC-unlocked.pdf', import.meta.url).href,
    description: 'National certification recognizing competency in installing, configuring, and maintaining computer systems and networks.',
    skills: ['Computer Systems', 'Hardware', 'Troubleshooting', 'Networking'],
  },
];

type Certification = (typeof certifications)[number];
const selectedCertification = ref<Certification | null>(null);

const openCertification = (certification: Certification) => {
  selectedCertification.value = certification;
};

const closeCertification = () => {
  selectedCertification.value = null;
};

const handleKeydown = (event: KeyboardEvent) => {
  if (event.key === 'Escape') closeCertification();
};

onMounted(() => {
  window.addEventListener('keydown', handleKeydown);
});

onBeforeUnmount(() => {
  window.removeEventListener('keydown', handleKeydown);
});
</script>

<template>
  <section id="projects" class="projects-section">
    <div class="projects-wrap">
      <header class="projects-heading">
        <span class="eyebrow">Selected work / 01—04</span>
        <h2>Projects built to solve real needs.</h2>
        <p>From a college scheduling capstone to inventory, travel, and public health systems.</p>
      </header>

      <div class="projects-grid">
        <article v-for="(project, index) in projects" :key="project.title" class="project-card">
          <div class="project-visual">
            <span class="project-index">0{{ index + 1 }} / FEATURED</span>
            <a
              :href="project.preview"
              target="_blank"
              rel="noopener noreferrer"
              class="project-preview-link"
              :aria-label="`Visit ${project.title} live site`"
            >
              <img :src="project.image" :alt="`${project.title} web app screenshot`" />
              <span class="image-visit-hint">Visit live site <span aria-hidden="true">↗</span></span>
            </a>
            <span class="visual-caption">WEB PLATFORM <span aria-hidden="true">·</span> MOBILE BUILD</span>
          </div>

          <div class="project-details">
            <div class="project-title-block">
              <div class="project-kicker">
                <span class="status-indicator"></span>
                {{ project.status }}
              </div>
              <span class="deployment-badge is-deployed">{{ project.deployment }}</span>
              <h3>{{ project.title }}</h3>
              <p class="project-description">{{ project.description }}</p>
              <p class="project-description">
                Designed for the College of Information Technology, with an Android app build explored using Ionic Vue and Capacitor.
              </p>
              <div class="technology-heading">TECH STACK</div>
              <ul v-if="project.technologies?.length" class="project-technologies" aria-label="Technologies used">
                <li v-for="technology in project.technologies" :key="technology">{{ technology }}</li>
              </ul>
              <div class="project-actions">
                <a :href="project.preview" target="_blank" rel="noopener noreferrer" class="project-cta">
                  Explore project
                  <svg viewBox="0 0 24 24" fill="none" aria-hidden="true">
                    <path d="M7 17 17 7M7 7h10v10" />
                  </svg>
                </a>
                <span class="project-domain">citscheduler.com</span>
              </div>
            </div>
          </div>
        </article>
      </div>

      <section class="other-projects" aria-labelledby="other-projects-title">
        <header class="other-projects-heading">
          <span>MORE BUILDS</span>
          <h3 id="other-projects-title">A few more things I've made.</h3>
        </header>
        <div class="other-projects-grid">
          <article
            v-for="project in otherProjects"
            :key="project.title"
            class="other-project-card"
          >
            <div class="other-project-topline">
              <span class="other-project-number">{{ project.number }}</span>
              <span class="other-project-category">{{ project.category }}</span>
            </div>
            <span class="deployment-badge is-not-deployed">{{ project.deployment }}</span>
            <div class="other-project-image">
              <img :src="project.image" :alt="`${project.title} screenshot`" loading="lazy" />
            </div>
            <h4>{{ project.title }}</h4>
            <p>{{ project.description }}</p>
            <ul class="other-project-technologies" :aria-label="`${project.title} technologies`">
              <li v-for="technology in project.technologies" :key="technology">
                {{ technology }}
              </li>
            </ul>
          </article>
        </div>
      </section>

      <div class="certifications-section">
        <header class="background-heading">
          <span class="background-eyebrow">Background</span>
          <h2>Education &amp; Experience</h2>
          <p>My academic journey and professional growth</p>
        </header>
        <h3 class="certification-title">Certifications &amp; Achievements</h3>

        <div class="certification-grid">
          <button
            v-for="cert in certifications"
            :key="cert.title"
            type="button"
            class="cert-card"
            :aria-label="`View ${cert.title} certificate details`"
            @click="openCertification(cert)"
          >
            <div class="certificate-preview">
              <div class="certificate-art" aria-hidden="true">
                <div class="certificate-art-paper">
                  <span class="certificate-art-issuer">{{ cert.issuer }}</span>
                  <span class="certificate-art-seal">✦</span>
                  <span class="certificate-art-label">Certificate</span>
                  <span class="certificate-art-rule"></span>
                  <span class="certificate-art-year">{{ cert.year }}</span>
                </div>
              </div>
              <div class="certificate-overlay">
                <span class="certificate-year">{{ cert.year }}</span>
                <h4>{{ cert.title }}</h4>
                <p>{{ cert.issuer }} <span aria-hidden="true">•</span> {{ cert.year }}</p>
              </div>
            </div>
          </button>
        </div>
      </div>

    </div>
  </section>

  <Teleport to="body">
    <div
      v-if="selectedCertification"
      class="certificate-modal-backdrop"
      @click.self="closeCertification"
    >
      <section
        class="certificate-modal"
        role="dialog"
        aria-modal="true"
        :aria-label="`${selectedCertification.title} details`"
      >
        <button
          type="button"
          class="modal-close"
          aria-label="Close certificate details"
          @click="closeCertification"
        >
          <svg viewBox="0 0 24 24" aria-hidden="true">
            <path d="M18.3 5.71 12 12l6.3 6.29-1.42 1.42L10.59 13.4l-6.3 6.31-1.42-1.42L9.17 12 2.87 5.71l1.42-1.42 6.3 6.3 6.29-6.3z" />
          </svg>
        </button>

        <div class="modal-certificate-image">
          <div class="modal-document-card">
            <span class="modal-document-icon" aria-hidden="true">PDF</span>
            <h3>{{ selectedCertification.title }}</h3>
            <p>{{ selectedCertification.issuer }} · {{ selectedCertification.year }}</p>
            <a
              :href="selectedCertification.document"
              target="_blank"
              rel="noopener noreferrer"
              class="certificate-document-link"
            >
              Open certificate PDF
              <span aria-hidden="true">↗</span>
            </a>
            <a
              :href="selectedCertification.document"
              :download="`${selectedCertification.title}.pdf`"
              class="certificate-download-link"
            >
              Download PDF
            </a>
          </div>
        </div>

        <div class="modal-content">
          <span class="certificate-year">{{ selectedCertification.year }}</span>
          <h2>{{ selectedCertification.title }}</h2>
          <p class="modal-issuer">
            {{ selectedCertification.issuer }} <span aria-hidden="true">•</span>
            {{ selectedCertification.year }}
          </p>
          <p class="modal-description">{{ selectedCertification.description }}</p>
          <h3>Skills Acquired:</h3>
          <ul class="skill-tags">
            <li v-for="skill in selectedCertification.skills" :key="skill">{{ skill }}</li>
          </ul>
        </div>
      </section>
    </div>
  </Teleport>
</template>

<style scoped>
.projects-section {
  position: relative;
  isolation: isolate;
  overflow: hidden;
  padding: 3rem 0;
  border-top: 1px solid rgba(148, 190, 230, 0.12);
  color: var(--white);
  background: radial-gradient(ellipse at 18% 50%, rgba(14, 116, 190, 0.12), transparent 42%);
}

.projects-section::before {
  position: absolute;
  z-index: 0;
  inset: 0;
  background:
    linear-gradient(rgba(100, 180, 255, 0.045) 1px, transparent 1px),
    linear-gradient(90deg, rgba(100, 180, 255, 0.045) 1px, transparent 1px);
  background-size: 44px 44px;
  animation: grid-drift 18s linear infinite;
  content: '';
  pointer-events: none;
}

.projects-wrap {
  position: relative;
  z-index: 1;
  max-width: 80rem;
  margin: 0 auto;
  padding: 0 1rem;
}

.projects-heading {
  max-width: 48rem;
  margin: 0 auto 2.5rem;
  text-align: center;
}

.projects-heading .eyebrow {
  color: var(--accent-cyan);
  font-size: 0.75rem;
  font-weight: 700;
  letter-spacing: 0.16em;
  text-transform: uppercase;
}

.projects-heading h2 {
  margin: 0.8rem 0 0;
  font-size: clamp(2rem, 4.5vw, 3.5rem);
  font-weight: 700;
  letter-spacing: -0.04em;
}

.projects-heading p {
  margin: 0.8rem 0 0;
  color: var(--white-icon);
  font-size: 1rem;
}

.projects-grid {
  display: block;
}

.project-card {
  display: grid;
  grid-template-columns: minmax(0, 1.25fr) minmax(18rem, 0.75fr);
  min-height: 25rem;
  overflow: hidden;
  border: 1px solid rgba(103, 183, 231, 0.2);
  border-radius: 1.5rem;
  background: linear-gradient(120deg, rgba(13, 35, 58, 0.94), rgba(7, 18, 33, 0.96));
  box-shadow: 0 24px 80px rgba(0, 0, 0, 0.28);
}

.project-visual {
  position: relative;
  display: flex;
  min-width: 0;
  min-height: 25rem;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  padding: 3rem;
  background:
    linear-gradient(rgba(103, 183, 231, 0.045) 1px, transparent 1px),
    linear-gradient(90deg, rgba(103, 183, 231, 0.045) 1px, transparent 1px),
    radial-gradient(ellipse at 50% 50%, rgba(21, 97, 154, 0.28), transparent 70%),
    #071321;
  background-size: 28px 28px, 28px 28px, auto, auto;
}

.project-visual::after {
  position: absolute;
  inset: 0;
  border: 1px solid rgba(103, 183, 231, 0.1);
  content: '';
  pointer-events: none;
}

.project-index,
.visual-caption {
  position: absolute;
  z-index: 1;
  color: rgba(202, 225, 245, 0.72);
  font-size: 0.65rem;
  font-weight: 700;
  letter-spacing: 0.14em;
}

.project-index {
  top: 1.25rem;
  left: 1.5rem;
}

.visual-caption {
  right: 1.5rem;
  bottom: 1.25rem;
}

.project-preview-link {
  position: relative;
  display: block;
  width: 100%;
  max-width: 46rem;
  overflow: hidden;
  border: 1px solid rgba(148, 190, 230, 0.28);
  border-radius: 0.9rem;
  background: #fff;
  box-shadow: 0 22px 50px rgba(0, 0, 0, 0.5);
}

.project-preview-link img {
  display: block;
  width: 100%;
  height: auto;
  aspect-ratio: 1.7;
  object-fit: cover;
  transition: transform 0.45s ease;
}

.project-preview-link:hover img {
  transform: scale(1.035);
}

.image-visit-hint {
  position: absolute;
  right: 0.9rem;
  bottom: 0.9rem;
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.5rem 0.75rem;
  border: 1px solid rgba(255, 255, 255, 0.25);
  border-radius: 999px;
  background: rgba(5, 17, 30, 0.84);
  color: white;
  font-size: 0.75rem;
  opacity: 0;
  transform: translateY(4px);
  transition: opacity 0.2s ease, transform 0.2s ease;
}

.project-preview-link:hover .image-visit-hint,
.project-preview-link:focus-visible .image-visit-hint {
  opacity: 1;
  transform: translateY(0);
}

.project-details {
  display: flex;
  align-items: center;
  padding: clamp(1.5rem, 4vw, 3rem);
}

.project-title-block {
  width: 100%;
}

.project-kicker {
  display: flex;
  align-items: center;
  gap: 0.6rem;
  color: var(--accent-cyan);
  font-size: 0.75rem;
  font-weight: 700;
  letter-spacing: 0.12em;
  text-transform: uppercase;
}

.deployment-badge {
  display: inline-flex;
  width: fit-content;
  align-items: center;
  gap: 0.4rem;
  margin-top: 0.8rem;
  padding: 0.3rem 0.6rem;
  border: 1px solid transparent;
  border-radius: 999px;
  font-size: 0.68rem;
  font-weight: 700;
  letter-spacing: 0.06em;
  text-transform: uppercase;
}

.deployment-badge::before {
  width: 0.42rem;
  height: 0.42rem;
  border-radius: 50%;
  background: currentColor;
  content: '';
}

.is-deployed {
  border-color: rgba(103, 232, 165, 0.24);
  background: rgba(26, 115, 75, 0.17);
  color: #8af0b8;
}

.is-not-deployed {
  border-color: rgba(148, 190, 230, 0.2);
  background: rgba(148, 190, 230, 0.08);
  color: #a9bfd4;
}

.status-indicator {
  width: 0.5rem;
  height: 0.5rem;
  border-radius: 50%;
  background: #67e8a5;
  box-shadow: 0 0 12px rgba(103, 232, 165, 0.6);
}

.project-title-block h3 {
  margin: 1rem 0 0;
  font-size: clamp(1.8rem, 3vw, 2.7rem);
  font-weight: 700;
  letter-spacing: -0.04em;
}

.project-description {
  margin: 0.85rem 0 0;
  color: var(--white-icon);
  font-size: 0.95rem;
  line-height: 1.65;
}

.technology-heading {
  margin-top: 1.5rem;
  color: rgba(202, 225, 245, 0.58);
  font-size: 0.65rem;
  font-weight: 700;
  letter-spacing: 0.14em;
}

.project-technologies {
  display: flex;
  flex-wrap: wrap;
  gap: 0.45rem;
  margin: 0.75rem 0 0;
  padding: 0;
  list-style: none;
}

.project-technologies li {
  padding: 0.35rem 0.65rem;
  border: 1px solid rgba(103, 183, 231, 0.19);
  border-radius: 0.45rem;
  color: #c3ddf4;
  background: rgba(32, 79, 118, 0.2);
  font-size: 0.72rem;
}

.project-actions {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 1rem;
  margin-top: 1.75rem;
}

.project-cta {
  display: inline-flex;
  min-height: 2.8rem;
  align-items: center;
  gap: 0.6rem;
  padding: 0.7rem 1rem;
  border: 1px solid rgba(56, 189, 248, 0.48);
  border-radius: 0.6rem;
  background: rgba(14, 116, 190, 0.2);
  color: #dff6ff;
  font-size: 0.85rem;
  font-weight: 650;
  transition: background 0.2s ease, border-color 0.2s ease;
}

.project-cta:hover {
  border-color: var(--accent-blue);
  background: rgba(14, 116, 190, 0.38);
}

.project-cta svg {
  width: 1rem;
  height: 1rem;
  stroke: currentColor;
  stroke-width: 1.8;
}

.project-domain {
  color: rgba(202, 225, 245, 0.62);
  font-size: 0.78rem;
}

.other-projects {
  margin-top: 2.25rem;
}

.other-projects-heading {
  margin-bottom: 1rem;
}

.other-projects-heading > span {
  color: var(--accent-cyan);
  font-size: 0.65rem;
  font-weight: 700;
  letter-spacing: 0.16em;
}

.other-projects-heading h3 {
  margin: 0.55rem 0 0;
  font-size: clamp(1.35rem, 2.6vw, 1.8rem);
  font-weight: 650;
}

.other-projects-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1rem;
}

.other-project-card {
  position: relative;
  min-width: 0;
  overflow: hidden;
  padding: 1.25rem;
  border: 1px solid rgba(103, 183, 231, 0.19);
  border-radius: 1rem;
  background:
    linear-gradient(rgba(103, 183, 231, 0.035) 1px, transparent 1px),
    linear-gradient(90deg, rgba(103, 183, 231, 0.035) 1px, transparent 1px),
    linear-gradient(145deg, rgba(13, 35, 58, 0.96), rgba(7, 18, 33, 0.98));
  background-size: 24px 24px, 24px 24px, auto;
  transition: transform 0.22s ease, border-color 0.22s ease;
}

.other-project-card:hover {
  transform: translateY(-3px);
  border-color: rgba(56, 189, 248, 0.48);
}

.other-project-topline {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 0.75rem;
}

.other-project-number {
  color: var(--accent-cyan);
  font-size: 0.7rem;
  font-weight: 700;
  letter-spacing: 0.12em;
}

.other-project-category {
  color: rgba(202, 225, 245, 0.62);
  font-size: 0.66rem;
  text-align: right;
}

.other-project-image {
  overflow: hidden;
  aspect-ratio: 16 / 8.5;
  margin: 0.9rem 0;
  border: 1px solid rgba(103, 183, 231, 0.19);
  border-radius: 0.65rem;
  background: #071321;
}

.other-project-image img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.35s ease;
}

.other-project-card:hover .other-project-image img {
  transform: scale(1.04);
}

.other-project-card h4 {
  margin: 0;
  font-size: 1.1rem;
  line-height: 1.3;
}

.other-project-card > p {
  margin: 0.65rem 0 0;
  color: var(--white-icon);
  font-size: 0.85rem;
  line-height: 1.6;
}

.other-project-technologies {
  display: flex;
  flex-wrap: wrap;
  gap: 0.4rem;
  margin: 1rem 0 0;
  padding: 0;
  list-style: none;
}

.other-project-technologies li {
  padding: 0.28rem 0.55rem;
  border: 1px solid rgba(103, 183, 231, 0.2);
  border-radius: 0.4rem;
  color: #c3ddf4;
  background: rgba(32, 79, 118, 0.2);
  font-size: 0.7rem;
}

.certifications-section {
  position: relative;
  isolation: isolate;
  overflow: hidden;
  margin-top: 3rem;
  padding: 2rem 1.25rem;
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: 1.5rem;
  background:
    linear-gradient(rgba(100, 180, 255, 0.035) 1px, transparent 1px),
    linear-gradient(90deg, rgba(100, 180, 255, 0.035) 1px, transparent 1px),
    radial-gradient(ellipse at 95% 100%, rgba(14, 116, 190, 0.3), transparent 54%),
    #081525;
  background-size: 32px 32px, 32px 32px, auto, auto;
}

.background-heading {
  margin: 0 auto 3rem;
  text-align: center;
}

.background-eyebrow {
  color: var(--accent-cyan);
  font-size: 0.75rem;
  font-weight: 700;
  letter-spacing: 0.14em;
  text-transform: uppercase;
}

.background-heading h2 {
  margin: 0.75rem 0 0;
  color: var(--white);
  font-size: clamp(1.8rem, 4vw, 2.5rem);
  font-weight: 700;
}

.background-heading p {
  margin: 0.75rem 0 0;
  color: #b7b2bb;
  font-size: 0.95rem;
}

.certification-title {
  margin: 0 0 2rem;
  text-align: center;
  font-size: clamp(1.5rem, 3vw, 2rem);
  font-weight: 650;
}

.certification-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.5rem;
}

.cert-card {
  min-width: 0;
  padding: 0;
  border: 0;
  border-radius: 0.9rem;
  color: inherit;
  text-align: left;
  background: transparent;
  cursor: pointer;
}

.certificate-preview {
  position: relative;
  overflow: hidden;
  aspect-ratio: 1.5;
  border: 1px solid rgba(255, 255, 255, 0.22);
  border-radius: 0.9rem;
  background: linear-gradient(145deg, #ece9e3, #c7c4be 52%, #817c75);
  box-shadow: 0 14px 30px rgba(0, 0, 0, 0.32);
  transition: transform 0.25s ease, border-color 0.25s ease;
}

.cert-card:hover .certificate-preview {
  transform: translateY(-4px);
  border-color: rgba(255, 255, 255, 0.48);
}

.certificate-art {
  position: absolute;
  inset: 0;
  display: grid;
  place-items: center;
  overflow: hidden;
  padding: 1rem;
  background:
    radial-gradient(ellipse at 50% 15%, rgba(120, 202, 255, 0.24), transparent 55%),
    linear-gradient(145deg, #152f48, #091827 72%);
}

.certificate-art-paper {
  position: relative;
  display: flex;
  width: min(74%, 16rem);
  height: 78%;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 0.45rem;
  overflow: hidden;
  border: 1px solid rgba(222, 197, 137, 0.7);
  border-radius: 0.2rem;
  background:
    linear-gradient(rgba(156, 128, 75, 0.07) 1px, transparent 1px),
    linear-gradient(90deg, rgba(156, 128, 75, 0.07) 1px, transparent 1px),
    linear-gradient(145deg, #f6f1df, #e7ddbf);
  background-size: 14px 14px, 14px 14px, auto;
  color: #26394a;
  box-shadow: 0 12px 30px rgba(0, 0, 0, 0.35);
  transform: rotate(-2deg);
}

.certificate-art-paper::before {
  position: absolute;
  inset: 0.4rem;
  border: 1px solid rgba(156, 128, 75, 0.35);
  content: '';
  pointer-events: none;
}

.certificate-art-issuer {
  max-width: 75%;
  overflow: hidden;
  color: #42617b;
  font-size: clamp(0.55rem, 1vw, 0.7rem);
  font-weight: 700;
  letter-spacing: 0.16em;
  text-overflow: ellipsis;
  text-transform: uppercase;
  white-space: nowrap;
}

.certificate-art-seal {
  display: grid;
  width: 2rem;
  height: 2rem;
  place-items: center;
  border: 1px solid rgba(149, 112, 49, 0.65);
  border-radius: 50%;
  color: #a07b34;
  font-size: 1.1rem;
}

.certificate-art-label {
  color: #26394a;
  font-family: Georgia, serif;
  font-size: clamp(0.85rem, 1.7vw, 1.2rem);
  font-weight: 700;
}

.certificate-art-rule {
  width: 45%;
  height: 1px;
  background: rgba(149, 112, 49, 0.6);
}

.certificate-art-year {
  color: #52677b;
  font-size: 0.65rem;
  letter-spacing: 0.14em;
}

.certificate-overlay {
  position: absolute;
  inset: 0;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: flex-end;
  padding: 1rem;
  color: white;
  background: linear-gradient(180deg, transparent 30%, rgba(0, 0, 0, 0.2) 48%, rgba(0, 0, 0, 0.92) 100%);
}

.certificate-year {
  margin-bottom: 0.4rem;
  padding: 0.25rem 0.7rem;
  border-radius: 999px;
  background: #087db4;
  color: white;
  font-size: 0.75rem;
  font-weight: 700;
}

.certificate-overlay h4 {
  margin: 0;
  font-size: clamp(1rem, 1.7vw, 1.35rem);
  font-weight: 700;
  line-height: 1.15;
  text-shadow: 0 1px 3px rgba(0, 0, 0, 0.65);
}

.certificate-overlay p {
  margin: 0.45rem 0 0;
  color: rgba(255, 255, 255, 0.8);
  font-size: 0.8rem;
}

.certificate-modal-backdrop {
  position: fixed;
  inset: 0;
  z-index: 1000;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow-y: auto;
  padding: 1.25rem;
  background: rgba(0, 0, 0, 0.84);
  backdrop-filter: blur(5px);
}

.certificate-modal {
  position: relative;
  width: min(100%, 32rem);
  max-height: calc(100vh - 2.5rem);
  overflow-y: auto;
  border: 1px solid rgba(56, 189, 248, 0.35);
  border-radius: 1.5rem;
  background: #080808;
  box-shadow: 0 24px 80px rgba(0, 0, 0, 0.65);
}

.modal-close {
  position: absolute;
  top: 1rem;
  right: 1rem;
  z-index: 2;
  display: grid;
  width: 2.75rem;
  height: 2.75rem;
  place-items: center;
  border: 0;
  border-radius: 50%;
  background: #087db4;
  color: white;
  cursor: pointer;
  transition: transform 0.2s ease, background-color 0.2s ease;
}

.modal-close:hover {
  transform: scale(1.06);
  background: #0b91ca;
}

.modal-close svg {
  width: 1.5rem;
  height: 1.5rem;
  fill: currentColor;
}

.modal-certificate-image {
  position: relative;
  display: grid;
  min-height: 14rem;
  place-items: center;
  margin: 1rem 2rem 0;
  border-radius: 0.75rem;
  background:
    radial-gradient(ellipse at 50% 0%, rgba(56, 189, 248, 0.17), transparent 70%),
    #0d1c2b;
}

.modal-document-card {
  display: flex;
  width: 100%;
  flex-direction: column;
  align-items: center;
  padding: 2rem 1.5rem;
  text-align: center;
}

.modal-document-icon {
  display: grid;
  width: 3.5rem;
  height: 4rem;
  place-items: center;
  border: 1px solid rgba(103, 232, 249, 0.45);
  border-radius: 0.55rem;
  background: rgba(14, 116, 190, 0.2);
  color: var(--accent-cyan);
  font-size: 0.85rem;
  font-weight: 800;
  letter-spacing: 0.08em;
}

.modal-document-card h3 {
  margin: 1rem 0 0;
  font-size: 1.1rem;
}

.modal-document-card p {
  margin: 0.45rem 0 0;
  color: var(--white-icon);
  font-size: 0.85rem;
}

.certificate-document-link,
.certificate-download-link {
  display: inline-flex;
  min-height: 2.75rem;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  margin-top: 1.25rem;
  padding: 0.65rem 1rem;
  border: 1px solid rgba(56, 189, 248, 0.48);
  border-radius: 0.6rem;
  background: rgba(14, 116, 190, 0.2);
  color: #dff6ff;
  font-size: 0.85rem;
  font-weight: 650;
}

.certificate-download-link {
  min-height: auto;
  margin-top: 0.75rem;
  padding: 0;
  border: 0;
  background: transparent;
  color: var(--white-icon);
  font-size: 0.8rem;
  font-weight: 500;
  text-decoration: underline;
  text-underline-offset: 0.2em;
}

.certificate-document-link:hover,
.certificate-document-link:focus-visible {
  border-color: var(--accent-blue);
  background: rgba(14, 116, 190, 0.38);
}

.certificate-download-link:hover,
.certificate-download-link:focus-visible {
  color: var(--accent-cyan);
}

.modal-content {
  margin-top: 2rem;
  padding: 1.5rem;
  border-top: 1px solid rgba(255, 255, 255, 0.08);
}

.modal-content .certificate-year {
  display: inline-block;
}

.modal-content h2 {
  margin: 0.5rem 0 0;
  font-size: clamp(1.4rem, 4vw, 1.7rem);
  line-height: 1.2;
}

.modal-issuer {
  margin: 0.5rem 0 0;
  color: var(--accent-cyan);
  font-weight: 600;
}

.modal-description {
  margin: 1.25rem 0;
  color: #d0d0d0;
  line-height: 1.6;
}

.modal-content h3 {
  margin: 0 0 0.75rem;
  color: var(--accent-cyan);
  font-size: 1rem;
  font-weight: 600;
}

.skill-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin: 0;
  padding: 0;
  list-style: none;
}

.skill-tags li {
  padding: 0.35rem 0.7rem;
  border: 1px solid rgba(56, 189, 248, 0.42);
  border-radius: 999px;
  color: #c6efff;
  font-size: 0.8rem;
}

.more-projects-link {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  width: 100%;
  margin-top: 2.25rem;
  padding: 0.75rem 1rem;
  border-radius: 0.65rem;
  border: 1px solid rgba(103, 183, 231, 0.2);
  background: rgba(10, 25, 43, 0.65);
  color: var(--white-icon);
  transition: all 0.3s ease;
}

.more-projects-link:hover {
  color: var(--accent-cyan);
  background: rgba(14, 45, 75, 0.8);
}

.more-projects-link span {
  color: var(--accent-cyan);
}

@media (min-width: 768px) {
  .other-projects-grid {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }

  .certification-grid {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}

@media (min-width: 1024px) {
  .certifications-section {
    padding: 2rem;
  }

  .certification-grid {
    grid-template-columns: repeat(3, minmax(0, 1fr));
  }

  .other-projects-grid {
    grid-template-columns: repeat(3, minmax(0, 1fr));
  }
}

@media (max-width: 767px) {
  .project-card {
    grid-template-columns: 1fr;
  }

  .project-visual {
    min-height: 0;
    padding: 3.5rem 1rem;
  }

  .project-preview-link img {
    aspect-ratio: 1.45;
  }

  .project-details {
    padding: 1.5rem;
  }
}

@media (max-width: 480px) {
  .certificate-modal-backdrop {
    padding: 0.75rem;
  }

  .certificate-modal {
    max-height: calc(100vh - 1.5rem);
  }

  .modal-certificate-image {
    margin: 0.75rem 0.75rem 0;
  }

  .modal-content {
    padding: 1.25rem;
  }
}

@media (prefers-reduced-motion: reduce) {
  .projects-section::before {
    animation: none;
  }
}
</style>
