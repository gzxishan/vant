<template>
  <div class="van-doc">
    <doc-header
      :lang="lang"
      :config="config"
      :versions="versions"
      :lang-configs="langConfigs"
      @switch-version="$emit('switch-version', $event)"
    />
    <doc-nav :lang="lang" :nav-config="config.nav" />
    <doc-container :has-simulator="hasSimulator">
      <doc-content>
        <slot />
      </doc-content>
    </doc-container>
    <doc-simulator v-if="hasSimulator" :src="simulator" />
  </div>
</template>

<script>
import DocNav from './Nav';
import DocHeader from './Header';
import DocContent from './Content';
import DocContainer from './Container';
import DocSimulator from './Simulator';

export default {
  name: 'van-doc',

  components: {
    DocNav,
    DocHeader,
    DocContent,
    DocContainer,
    DocSimulator,
  },

  props: {
    lang: String,
    versions: Array,
    simulator: String,
    hasSimulator: Boolean,
    langConfigs: Array,
    config: {
      type: Object,
      required: true,
    },
    base: {
      type: String,
      default: '',
    },
  },

  watch: {
    // eslint-disable-next-line object-shorthand
    '$route.path'() {
      this.setNav();
    },
  },

  created() {
    this.setNav();
    this.keyboardHandler();
  },

  methods: {
    setNav() {
      const { nav } = this.config;
      const items = nav.reduce((list, item) => list.concat(item.items), []);
      const currentPath = this.$route.path.split('/').pop();

      let currentIndex;
      for (let i = 0, len = items.length; i < len; i++) {
        if (items[i].path === currentPath) {
          currentIndex = i;
          break;
        }
      }

      this.leftNav = items[currentIndex - 1];
      this.rightNav = items[currentIndex + 1];
    },

    keyboardNav(direction) {
      if (/win(32|64)/.test(navigator.userAgent.toLocaleLowerCase())) {
        return;
      }

      const nav = direction === 'prev' ? this.leftNav : this.rightNav;
      if (nav.path) {
        this.$router.push(this.base + nav.path);
      }
    },

    keyboardHandler() {
      window.addEventListener('keyup', (event) => {
        switch (event.keyCode) {
          case 37: // left
            this.keyboardNav('prev');
            break;
          case 39: // right
            this.keyboardNav('next');
            break;
        }
      });
    },
  },
};
</script>

<style lang="less">
@import '../../common/style/var';
</style>
