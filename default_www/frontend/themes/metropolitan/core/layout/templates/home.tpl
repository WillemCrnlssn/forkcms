{include:core/layout/templates/head.tpl}

<body id="home" class="{$LANGUAGE}">
	<div id="topWrapper" class="clearfix">
		<header role="banner" id="header">
			<div class="container">
				<div id="topBar">
					<div id="logo">
						<h1><a href="#" title="">Metropolitan</a></h1>
					</div>

					<div id="topMeta">
						{* Block 14 (default: Search) *}
						{option:block14IsHTML}
							{option:block14}
								{$block14}
							{/option:block14}
						{/option:block14IsHTML}
						{option:!block14IsHTML}
								{include:{$block14}}
						{/option:!block14IsHTML}

						{include:core/layout/templates/languages.tpl}
					</div>
				</div>

				{* Navigation *}

				{$var|getnavigation:'page':0:1}


				<div id="skip">
					<p><a href="#main">{$lblSkipToContent|ucfirst}</a></p>
				</div>

				{* Block 1 (default: Editor) *}
				{option:block1IsHTML}
					{option:block1}
						<section id="headerfocus">
							<h2>{$block1}</h2>
						</section>
					{/option:block1}
				{/option:block1IsHTML}
				{option:!block1IsHTML}
					{include:{$block1}}
				{/option:!block1IsHTML}
			</div>
		</header>

		<div id="main" class="container">
			<section class="cols3 clearfix">
				<header>
					<div class="sectionTitle">
						<h2><span>{$block2}</span></h2>
					</div>
				</header>



				<div class="col1">
					<img src="images/building1.png" alt="art deco building"/>
					<h3>Spotlight</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lobortis tempus ultrices. <a href="#">Pellentesque</a> habitant morbi tristique senectus et netus et malesuada fames ac</p>
					<span class="arrow"></span><a href="#" class="readMore">Read more</a>
				</div>

				<div class="col2">
					<img src="images/building2.png" alt="art deco building"/>
					<h3>Spotlight</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lobortis tempus ultrices. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec eget sagittis risus.</p>
					<span class="arrow"></span><a href="#" class="readMore">Read more</a>
				</div>

				<div class="col3">
					<img src="images/building3.png" alt="art deco building"/>
					<h3>Spotlight</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lobortis tempus ultrices. <a href="#">Pellentesque</a> habitant morbi tristique senectus et netus et malesuada fames ac</p>
					<span class="arrow"></span><a href="#" class="readMore">Read more</a>
				</div>
			</section>

			<section class="cols2 clearfix">
				<header>
					<div class="sectionTitle">
						<h2><span>{$block6}</span></h2>
					</div>
				</header>

				<div class="col1">
					<h3>Post with picture</h3>
					<img src="images/building4.png" alt="some random building"/>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lobortis tempus ultrices. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec eget sagittis risus.</p>
					<span class="arrow"></span><a href="#" class="readMore">Read more</a>
				</div>

				<div class="col2">
					<h3>Post with picture</h3>
					<img src="images/building5.png" alt="some random building"/>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lobortis tempus ultrices. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec eget sagittis risus.</p>
					<span class="arrow"></span><a href="#" class="readMore">Read more</a>
				</div>

			</section>

			<section class="cols2 clearfix">
				<header>
					<div class="sectionTitle">
						<h2><span>{$block9}</span></h2>
					</div>
				</header>

				<div class="col1">
					<h3>Post</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam fringilla accumsan sapien, vel egestas turpis euismod non. Etiam vitae quam non metus porta sollicitudin ut ut libero. Vestibulum pellentesque dapibus dolor, non euismod lorem tristique non. Praesent eget blandit mi. Nam eu erat eu dui tincidunt faucibus vitae ut dui. Integer a ultrices libero. Integer a dui leo. Nam auctor dolor eu ipsum tincidunt at consequat justo gravida. Praesent ut est non leo molestie venenatis. Donec vitae sollicitudin nulla. Suspendisse adipiscing molestie lacus, vel fringilla turpis consequat sed. Aliquam vel erat sed leo sodales	malesuada. Mauris vel purus velit. Etiam blandit pharetra .</p>
					<span class="arrow"></span><a href="#" class="readMore">Read more</a>
				</div>

				<div class="col2">
					<h3>Post</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam fringilla accumsan sapien, vel egestas turpis euismod non. Etiam vitae quam non metus porta sollicitudin ut ut libero. Vestibulum pellentesque dapibus dolor, non euismod lorem tristique non. Praesent eget blandit mi. Nam eu erat eu dui tincidunt faucibus vitae ut dui. Integer a ultrices libero. Integer a dui leo. Nam auctor dolor eu ipsum tincidunt at consequat justo gravida. Praesent ut est non leo molestie venenatis. Donec vitae sollicitudin nulla. Suspendisse adipiscina .</p>
					<span class="arrow"></span><a href="#" class="readMore">Read more</a>
				</div>

			</section>

			<section class="cols1 clearfix">
				<header>
					<div class="sectionTitle">
						<h2><span>{$block12}</span></h2>
					</div>
				</header>
				<div class="col1">
					<p>Nunc dolor tortor, bibendum aliquam porttitor vel, dictum at dolor. Aenean adipiscing volutpat sem, id facilisis risus tincidunt ac. In hac habitasse platea dictumst. Integer tincidunt vestibulum turpis, sit amet tempus sapien iaculis vel. Duis at tellus erat. Proin viverra, lacus sit amet sodales congue, purus leo tincidunt ante, vitae sagittis leo metus sit amet odio. Integer ac sapien odio, sit amet dignissim est. Suspendisse quis neque sed quam condimentum adipiscing. Morbi faucibus magna et turpis bibendum commodo. Morbi sit amet sapien nulla, ac venenatis odio. Aenean iaculis faucibus mi, non ultrices sem mattis ut. Pellentesque euismod vestibulum purus, eget bibendum velit dignissim nec. Mauris vel eros sit amet lectus faucibus ornare non tempor urna. Fusce sed malesuada mauris. Duis non velit hendrerit lectus fermentum interdum id at augue. Ut eros mauris, dictum ac auctor vel, vulputate vel dui. Mauris in diam mauris, at iaculis nunc. Morbi felis urna, dictum sed dictum et, sodales at magna. Vivamus </p>
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
	<script src="{$THEME_URL}/core/js/triton.js"></script>
</body>
</html>