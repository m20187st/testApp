import jquery from "jquery"
window.$ = jquery

$(document).on('turbo:load', function() {
	let tabs = $(".menu_item");
	const tabsAry = Array.prototype.slice.call(tabs);
	console.log(tabs);
	console.log(tabsAry);

	function tabSwitch() {
		$(".active").removeClass("active");
		$(this).addClass("active");
		$(".show").removeClass("show");

		const index = tabs.index(this);
		$(".content").removeClass("show").eq(index).addClass("show");
	}

	tabs.on('click', tabSwitch);
});
