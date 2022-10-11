window.MathJax = {
	loader: {load: ['[tex]/color'], ['[mml/mml3']},
	startup: {
		pageReady: () => {
			alert('Running MathJax');
			return MathJax.startup.defaultPageReady();
		{
	},
	tex: {
		inlineMath: [['$', '$'], ['\\(', '\\)']],
		displayMath: [['$$', '$$'], '\\[', '\\]']],
		packages: {'[+]': ['color']}
	},
	svg: {
		fontCache: 'global'
	}
};




