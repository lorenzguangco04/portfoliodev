<script setup lang="ts">
import { computed, ref } from 'vue';

const CategoryIcons = {
  'Backend Development': '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><rect x="3" y="4" width="18" height="6" rx="2"></rect><rect x="3" y="14" width="18" height="6" rx="2"></rect><path d="M7 7h.01M7 17h.01M11 7h6M11 17h6"></path></svg>',
  'Databases & APIs': '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><ellipse cx="12" cy="5" rx="9" ry="3"></ellipse><path d="M3 5v14c0 1.66 4.03 3 9 3s9-1.34 9-3V5M3 12c0 1.66 4.03 3 9 3s9-1.34 9-3"></path></svg>',
  'Tools & Professional Skills': '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><path d="m14.7 6.3 3 3M4 20l4.5-1 10.2-10.2a2.12 2.12 0 0 0-3-3L5.5 16 4 20Z"></path><path d="M3 4h6M3 8h4M3 12h2"></path></svg>',
} as const;

const skills = {
  'Backend Development': [
    'Server-side development with Node.js and PHP',
    'Building REST APIs',
    'Application logic and data handling',
  ],
  'Databases & APIs': [
    'MySQL and MongoDB Atlas',
    'Database design and CRUD operations',
    'REST API and JSON integration',
  ],
  'Tools & Professional Skills': [
    'Git, GitHub, npm, and VS Code',
    'Deployment with Render and Vercel',
    'Problem-solving, teamwork, and attention to detail',
  ],
};

const openItem = ref<string | null>(null);
const skillEntries = computed(() => Object.entries(skills) as [string, string[]][]);

const toggleItem = (item: string) => {
  openItem.value = openItem.value === item ? null : item;
};
</script>

<template>
  <div class="skills-panel">
    <h3>What I do?</h3>
    <ul class="skills-list">
      <li v-for="[category, items] in skillEntries" :key="category" class="skill-item">
        <div :class="['accordion', { open: openItem === category }]" @click="toggleItem(category)">
          <div class="accordion-header">
            <div class="category-label">
              <span class="icon-wrap" v-html="CategoryIcons[category as keyof typeof CategoryIcons]" />
              <span class="category-name">{{ category }}</span>
            </div>
            <svg class="chevron" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
              <path d="M11.9999 13.1714L16.9497 8.22168L18.3639 9.63589L11.9999 15.9999L5.63599 9.63589L7.0502 8.22168L11.9999 13.1714Z"></path>
            </svg>
          </div>
          <div class="accordion-body" :class="{ active: openItem === category }">
            <ul class="item-list">
              <li v-for="(item, index) in items" :key="index" class="item-row">
                <span class="dot">•</span>
                <span>{{ item }}</span>
              </li>
            </ul>
          </div>
        </div>
      </li>
    </ul>
  </div>
</template>

<style scoped>
.skills-panel {
  text-align: left;
  padding-top: 0.75rem;
}

h3 {
  margin: 0;
  color: var(--white);
  font-size: clamp(2rem, 4vw, 2.5rem);
  font-weight: 600;
  margin-bottom: 1.5rem;
}

.skills-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.accordion {
  width: min(100%, 25rem);
  background: rgba(20, 20, 20, 0.6);
  border-radius: 1rem;
  border: 1px solid var(--white-icon-tr);
  overflow: hidden;
  cursor: pointer;
  transition: all 0.3s ease;
}

.accordion:hover {
  background: rgba(27, 27, 27, 0.8);
}

.accordion-header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1rem;
  padding: 1rem;
}

.category-label {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  min-width: 0;
  max-width: 100%;
}

.icon-wrap {
  display: flex;
  color: var(--sec);
}

.icon-wrap :deep(svg) {
  width: 1.5rem;
  height: 1.5rem;
}

.category-name {
  display: block;
  color: var(--white);
  font-size: 1.125rem;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.chevron {
  width: 1.5rem;
  height: 1.5rem;
  color: var(--white);
  transition: transform 0.3s ease;
}

.accordion.open .chevron {
  transform: rotate(180deg);
}

.accordion-body {
  max-height: 0;
  opacity: 0;
  overflow: hidden;
  transition: max-height 0.3s ease, opacity 0.3s ease, padding 0.3s ease;
  padding: 0 1rem;
}

.accordion-body.active {
  max-height: 500px;
  opacity: 1;
  padding: 0 1rem 1rem;
}

.item-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  color: var(--white-icon);
  font-size: 0.875rem;
}

.item-row {
  display: flex;
  align-items: center;
}

.dot {
  padding-left: 0.25rem;
}

.item-row span:last-child {
  padding-left: 0.75rem;
}

@media (min-width: 768px) {
  .skills-panel {
    padding-top: 2.25rem;
  }
}
</style>
