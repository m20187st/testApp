// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@fortawesome/fontawesome-free"

//import "./packs/tabSwap"

import jquery from "jquery"
window.$ = jquery

$(document).on('turbo:load', function() {
	let tabs = $(".menu_item-js");
	const tabsAry = Array.prototype.slice.call(tabs);
	console.log(tabs);
	console.log(tabsAry);

	function tabSwitch() {
		$(".active-js").removeClass("active-js");
		$(this).addClass("active-js");
		$(".show-js").removeClass("show-js");

		const index = tabs.index(this);
		$(".content-js").removeClass("show-js").eq(index).addClass("show-js");
	}

	tabs.on('click', tabSwitch);
});
