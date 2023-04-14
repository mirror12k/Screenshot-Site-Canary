const {executablePath} = require('puppeteer');
const puppeteer = require('puppeteer-extra');
const StealthPlugin = require('puppeteer-extra-plugin-stealth');

puppeteer.use(StealthPlugin());
const timeout = ms => new Promise(resolve => setTimeout(resolve, ms));

var url = process.argv[2];
var image_output_file = process.argv[3];

(async() => {
	console.log('starting browser...');
	const browser = await puppeteer.launch({
		headless: true,
		args: [
			'--no-sandbox',
		],
		executablePath: executablePath(),
	});
	console.log('requesting page...');
	const page = await browser.newPage();
	await page.setViewport({ width: 1920, height: 1920 });
	await page.goto(url);
	await timeout(2000);
	console.log('saving and closing...');
	await page.screenshot({ path: image_output_file });
	// await page.screenshot({ path: 'img/screenshot.png' });
	browser.close();
})();

