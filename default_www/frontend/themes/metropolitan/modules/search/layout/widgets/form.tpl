<aside id="headerSearch">
	<header>
		<h4 class="accessibility">Header Search</h4>
	</header>
	{form:search}
		<p>
			<input id="searchButton" class="inputSubmit" type="submit" name="submit" value="{$lblSearch|ucfirst}" />
			{$txtQWidget}
		</p>
	{/form:search}
</aside>