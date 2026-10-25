<script setup lang="ts">
import { computed, ref } from 'vue';

const CategoryIcons = {
  'Web Development': '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><rect width="20" height="16" x="2" y="4" rx="2"></rect><path d="M6 8h.01"></path><path d="M10 8h.01"></path><path d="M14 8h.01"></path></svg>',
  'Mobile Development': '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><rect width="10" height="14" x="3" y="8" rx="2"></rect><path d="M5 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v16a2 2 0 0 1-2 2h-2.4"></path><path d="M8 18h.01"></path></svg>',
  'UI/UX Design & Prototyping': '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon"><path d="M12.034 12.681a.498.498 0 0 1 .647-.647l9 3.5a.5.5 0 0 1-.033.943l-3.444 1.068a1 1 0 0 0-.66.66l-1.067 3.443a.5.5 0 0 1-.943.033z"></path><path d="M5 17A12 12 0 0 1 17 5"></path><circle cx="19" cy="5" r="2"></circle><circle cx="5" cy="19" r="2"></circle></svg>',
} as const;

const skills = {
  'Web Development': [
    'Single Page Applications (SPAs)',
    'Landing pages and business websites',
    'Portfolio websites',
  ],
  'Mobile Development': [
    'Mobile-friendly web apps',
    'Ionic Vue',
    'Capacitor',
    'Building Android APKs',
  ],
  'UI/UX Design & Prototyping': [
    'UI design with Figma & Canva',
    'UX research & improvements',
    'Prototyping for websites & mobile apps',
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
