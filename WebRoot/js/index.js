$(function() {
	$('#mainMenu')
			.tree(
					{
						url : path + '/getMenu',
						parentField : 'pid',
						onClick : function(node) {
							if (node.attributes.url) {
								var src = path + node.attributes.url;
								if (!$.startWith(node.attributes.url, '/')) { // 不是本项目的url，例如www.baidu.com
									src = node.attributes.url;
								}
								var tabs = $('#mainTabs');
								var opts = {
									title : node.text,
									closable : true,
									iconCls : node.iconCls,
									content : $
											.formatString(
													'<iframe src="{0}" allowTransparency="true" style="border:0;width:99%;height:99%;padding-left:2px;" frameBorder="0"></iframe>',
													src),
									border : false,
									fit : true
								};
								if (tabs.tabs('exists', opts.title)) {
									tabs.tabs('select', opts.title);
								} else {
									tabs.tabs('add', opts);
								}
							}
						}
					});
})