{option:languages}
	<nav id="language">
		<header>
			<h4 id="languageLabel">Language</h4>
		</header>
		<span id="arrowDown"></span>
			{option:languages}
				<ul>
					{iteration:languages}
						{option:languages.current}
							<li class="selected firstChild">
								<a href="{$languages.url}">{$languages.label}</a>
							</li>
						{/option:languages.current}
					{/iteration:languages}
					{iteration:languages}
						{option:!languages.current}
							<li>
								<a href="{$languages.url}">{$languages.label}</a>
							</li>
						{/option:!languages.current}
					{/iteration:languages}
				</ul>
			{/option:languages}

	</nav>
{/option:languages}