import { Controller } from '@hotwired/stimulus';
import Swiper from 'swiper';
import { Navigation } from 'swiper/modules';

import 'swiper/css';
import 'swiper/css/navigation';

export default class extends Controller {
    static targets = ["prev", "next"];

    connect() {
        this.swiper = new Swiper('.carousel', {
            modules: [Navigation],
            slidesPerView: 'auto',
            spaceBetween: 20,
            breakpoints: {
                768: {
                    spaceBetween: 30,
                }
            },
            navigation: {
                nextEl: this.nextTarget,
                prevEl: this.prevTarget,
            },
        });
        document.querySelector('.mobile > [data-carousel-target="prev"]').addEventListener('click', () => {
            this.swiper.slidePrev();
            this.handleSwiperPrev();
            this.handleSwiperNext();
        });
        document.querySelector('.mobile > [data-carousel-target="next"]').addEventListener('click', () => {
            this.swiper.slideNext();
            this.handleSwiperNext();
            this.handleSwiperPrev();
        });
        this.handleSwiperPrev();
        this.handleSwiperNext();
    }

    disconnect() {
        if (this.swiper) {
            this.swiper.destroy();
            this.swiper = undefined;
        }
    }

    handleSwiperPrev() {
        if (this.prevTarget.disabled) {
            document.querySelector('.mobile > [data-carousel-target="prev"]').classList.add('swiper-button-disabled');
        } else {
            document.querySelector('.mobile > [data-carousel-target="prev"]').classList.remove('swiper-button-disabled');
        }
    }

    handleSwiperNext() {
        if (this.nextTarget.disabled) {
            document.querySelector('.mobile > [data-carousel-target="next"]').classList.add('swiper-button-disabled');
        } else {
            document.querySelector('.mobile > [data-carousel-target="next"]').classList.remove('swiper-button-disabled');
        }
    }

}
