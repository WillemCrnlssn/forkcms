{include:core/layout/templates/head.tpl}

<body id="home" class="{$LANGUAGE}">
	<div id="topWrapper" class="clearfix">
		<header role="banner" id="header">
			<div class="container">
				<div id="topBar">
					<div id="logo">
						<h1><a href="/">{$siteTitle}</a></h1>
					</div>

					<div id="topMeta">
						{include:core/layout/templates/languages.tpl}

						{* Block 9 (default: Search) *}
						{option:block9IsHTML}
							{option:block9}
								{$block9}
							{/option:block9}
						{/option:block9IsHTML}
						{option:!block9IsHTML}
								{include:{$block9}}
						{/option:!block9IsHTML}
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

				{* Block 1 (default: Editor) *}
				{option:block1IsHTML}
					{option:block1}
						<section id="headerfocus">
							<h2>{$block1|striptags}</h2>
						</section>
					{/option:block1}
				{/option:block1IsHTML}
				{option:!block1IsHTML}
					{include:{$block1}}
				{/option:!block1IsHTML}
			</div>
		</header>

		<div id="main" class="container">
				{* Block 2 (default: Editor) *}
				{option:block2IsHTML}
					{option:block2}
						<header>
							<div class="sectionTitle">
								<h2><span>{$block2|striptags}</span></h2>
							</div>
						</header>
					{/option:block2}
				{/option:block2IsHTML}

				{* Block 3 (default: Recent Articles) *}
				{option:block3IsHTML}
					{option:block3}
						{$block3}
					{/option:block3}
				{/option:block3IsHTML}
				{option:!block3IsHTML}
					{include:{$block3}}
				{/option:!block3IsHTML}

				<section class="cols2 clearfix">
					{* Block 4 (default: Editor) *}
					{option:block4IsHTML}
						{option:block4}
							<header>
								<div class="sectionTitle">
									<h2><span>{$block4|striptags}</span></h2>
								</div>
							</header>
						{/option:block4}
					{/option:block4IsHTML}

					<div class="col1">
						{option:block5IsHTML}
							{option:block5}
								{$block5}
							{/option:block5}
						{/option:block5IsHTML}
						{option:!block5IsHTML}
							{include:{$block5}}
						{/option:!block5IsHTML}
					</div>

					<div class="col2">
						{option:block5IsHTML}
							{option:block5}
								{$block5}
							{/option:block5}
						{/option:block5IsHTML}
						{option:!block5IsHTML}
							{include:{$block5}}
						{/option:!block5IsHTML}
					</div>

				</section>

				<section class="cols1 clearfix">
					{* Block 7 (default: Editor) *}
					{option:block7IsHTML}
						{option:block7}
							<header>
								<div class="sectionTitle">
									<h2><span>{$block7|striptags}</span></h2>
								</div>
							</header>
						{/option:block7}
					{/option:block7IsHTML}

					<div class="col1">
						{* Block 8 (default: Editor) *}
						{option:block8IsHTML}
							{option:block8}
								{$block8}
							{/option:block8}
						{/option:block8IsHTML}
						{option:!block8IsHTML}
							{include:{$block8}}
						{/option:!block8IsHTML}
					</div>
				</section>
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