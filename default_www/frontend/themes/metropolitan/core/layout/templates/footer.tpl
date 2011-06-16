<footer id="footer" class="container">
	<div>
		<div id="footerLogo">
			<p>&copy; {$now|date:'Y'} {$siteTitle}</p>
		</div>
		<nav id="footerNavigation">
			<h4 class="accessibility">{$lblFooterNavigation}</h4>
			<ul>
				{iteration:footerLinks}
					<li{option:footerLinks.selected} class="selected"{/option:footerLinks.selected}>
						<a href="{$footerLinks.url}" title="{$footerLinks.title}"{option:footerLinks.rel} rel="{$footerLinks.rel}"{/option:footerLinks.rel}>
							{$footerLinks.navigation_title}
						</a>
					</li>
				{/iteration:footerLinks}
				<li><a href="http://www.fork-cms.be" title="Fork CMS">Fork CMS</a></li>
			</ul>
		</nav>
	</div>
</footer>