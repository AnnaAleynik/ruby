import orderBy from 'lodash/orderBy';

class SorterCards {
  constructor($el) {
    this.$el = $el; 
    this.items = this.$el.querySelectorAll('.js-item');
    this.list = this.$el.querySelector('.js-cards-list');

    this.sortButtonASC = this.$el.querySelector('.js-sort-asc');
    this.sortButtonDESC = this.$el.querySelector('.js-sort-desc');

    this.dataAttributes = Array.from(this.items).map(
      item => {
        return {
          node: item,
          ...JSON.parse(item.getAttribute('data-card')),

        }
      }
    );

    this.bindEvents();
  }

  bindEvents() {
    this.sortButtonASC.addEventListener('click', this.sortByTitleASC);
    this.sortButtonDESC.addEventListener('click', this.sortByTitleDESC);
  }

  sortByTitleASC = () => {
    this.sortButtonASC.classList.add('hidden');
    this.sortButtonDESC.classList.remove('hidden');
    const sortItemsByTitle = orderBy(this.dataAttributes, ['title'], ['asc']);
    sortItemsByTitle.forEach((item) => this.list.appendChild(item.node));

  }

  sortByTitleDESC = () => {
    this.sortButtonDESC.classList.add('hidden');
    this.sortButtonASC.classList.remove('hidden');
    const sortItemsByTitle = orderBy(this.dataAttributes, ['title'], ['desc']);
    sortItemsByTitle.forEach((item) => this.list.appendChild(item.node));
  }

}

export default SorterCards;
