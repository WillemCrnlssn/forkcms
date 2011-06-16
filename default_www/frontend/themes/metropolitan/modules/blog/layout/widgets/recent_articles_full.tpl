{*
	variables that are available:
	- {$widgetBlogRecentArticlesFull}: contains an array with all posts, each element contains data about the post
*}

<section class="cols3 clearfix">
	{option:widgetBlogRecentArticlesFull}
		{iteration:widgetBlogRecentArticlesFull}
			<div class="col2">
				<h3><a href="{$widgetBlogRecentArticlesFull.full_url}" title="{$widgetBlogRecentArticlesFull.title}">{$widgetBlogRecentArticlesFull.title}</a></h3>

					{option:!widgetBlogRecentArticlesFull.introduction}{$widgetBlogRecentArticlesFull.text|truncate:300}{/option:!widgetBlogRecentArticlesFull.introduction}
					{option:widgetBlogRecentArticlesFull.introduction}{$widgetBlogRecentArticlesFull.introduction}{/option:widgetBlogRecentArticlesFull.introduction}

					<div class="comments"><a href="{$widgetBlogRecentArticlesFull.full_url}" class="readMore">{$widgetBlogRecentArticlesFull.comments_count}</a></div>
			</div>
		{/iteration:widgetBlogRecentArticlesFull}
	{/option:widgetBlogRecentArticlesFull}
</section>

