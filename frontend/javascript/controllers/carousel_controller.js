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
            navigation: {
                nextEl: this.nextTarget,
                prevEl: this.prevTarget,
            },
        });
    }

    disconnect() {
        if (this.swiper) {
            this.swiper.destroy();
            this.swiper = undefined;
        }
    }
}
