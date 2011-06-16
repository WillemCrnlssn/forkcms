{*
	variables that are available:
	- {$items}: contains an array with all posts, each element contains data about the post
*}

{option:!items}
	<div id="blogIndex">
		<section class="mod">
			<div class="inner">
				<div class="bd content">
					<p>{$msgBlogNoItems}</p>
				</div>
			</div>
		</section>
	</div>
{/option:!items}

{option:items}
	<div id="blogIndex">
		{iteration:items}
			<section class="cols1 clearfix">
				<header>
					<div class="sectionTitle">
						<h2><span><a href="{$items.full_url}" title="{$items.title}">{$items.title}</a></span></h2>
					</div>
				</header>

				<p class="postMeta">
					{$msgWrittenBy|ucfirst|sprintf:{$items.user_id|usersetting:'nickname'}}
					{$lblIn} <a href="{$items.category_full_url}" title="{$items.category_title}">{$items.category_title}</a>{option:!items.tags}{/option:!items.tags}
					{$lblOn} {$items.publish_on|date:{$dateFormatLong}:{$LANGUAGE}}
				</p>

				<div class="col1">
					{option:!items.introduction}{$items.text}{/option:!items.introduction}
					{option:items.introduction}{$items.introduction}{/option:items.introduction}
				</div>

				<div class="numComments">
					{* Comments *}
					{option:!items.comments}<a href="{$items.full_url}#{$actComment}">0</a>{/option:!items.comments}
					{option:items.comments}
						<a href="{$items.full_url}#{$actComments}">{$items.comments_count}</a>
					{/option:items.comments}
				</div>
			</section>
		{/iteration:items}
	</div>
	{include:{$FRONTEND_CORE_PATH}/layout/templates/pagination.tpl}
{/option:items}
