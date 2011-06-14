{include:core/layout/templates/head.tpl}

<body class="{$LANGUAGE}">
	<div id="topWrapper" class="clearfix">
		<header role="banner" id="header">
			<div class="container">
				<div id="topBar">
					<div id="logo">
						<h1><a href="/">{$siteTitle}</a></h1>
					</div>

					<div id="topMeta">

						{include:core/layout/templates/languages.tpl}

						{* Block 3 (default: Search) *}
						{option:block3IsHTML}
							{option:block3}
								{$block3}
							{/option:block3}
						{/option:block3IsHTML}
						{option:!block3IsHTML}
								{include:{$block3}}
						{/option:!block3IsHTML}
					</div>
				</div>

				{* Navigation *}
				<nav id="navigation">
					<header>
						<h4 class="accessibility">Navigation</h4>
					</header>
					{$var|getnavigation:'page':0:1}
				</nav>


				<div id="skip">
					<p><a href="#main">{$lblSkipToContent|ucfirst}</a></p>
				</div>

				<section id="headerfocus">
					<h2>{$page.title}</h2>
				</section>
			</div>
		</header>

		<div id="main" class="container">

			{* SubNavigation *}
			<nav id="subnavigation">
				<h4 class="accessibility">{$lblSubnavigation|ucfirst}</h4>
				{$var|getsubnavigation:'page':{$page.id}:2}
			</nav>

			{* Block 2 (default: Editor) *}
				{option:block1IsHTML}
					{option:block1}
						<header>
							<div class="sectionTitle">
								<h2><span>{$block1|striptags}</span></h2>
							</div>
						</header>
					{/option:block1}
				{/option:block1IsHTML}

			{option:block2IsHTML}
				{option:block2}
					<section class="cols1 clearfix">
						<div class="col1">
							{$block2}
						</div>
					</section>
				{/option:block2}
			{/option:block2IsHTML}
			{option:!block2IsHTML}
					{include:{$block2}}
			{/option:!block2IsHTML}

		</div>
	</div>

	<div id="bottomWrapper">
		{include:core/layout/templates/footer.tpl}
	</div>

	{* Site wide HTML *}
	{$siteHTMLFooter}

	{* General Javascript *}
	{iteration:javascriptFiles}
		<script src="{$javascriptFiles.file}"></script>
	{/iteration:javascriptFiles}

	{* Module specific Javascript *}
	<script src="{$THEME_URL}/core/js/metropolitan.js"></script>
</body>
</html>