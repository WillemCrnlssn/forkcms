<section class="cols1 clearfix">
	<header>
		<div class="sectionTitle">
			<h2><span>{$item.title}</span></h2>
		</div>
	</header>

	<p class="postMeta">
		{$msgWrittenBy|ucfirst|sprintf:{$item.user_id|usersetting:'nickname'}}
		{$lblIn} <a href="{$item.category_full_url}" title="{$item.category_title}">{$item.category_title}</a>{option:!items.tags}{/option:!items.tags}
		{$lblOn} {$item.publish_on|date:{$dateFormatLong}:{$LANGUAGE}}
	</p>

	<div class="col1">
		{$item.text}
	</div>
</section>

{* Comments *}

{option:comments}
	<section id="blogComments" class="container">
		<div>
			<header>
				<div class="sectionTitle">
					<h2 id="{$actComments}"><span>{$lblComments|ucfirst}</span></h2>
				</div>
			</header>
			<div class="bd content">
				{iteration:comments}
					{* Do not alter the id! It is used as an anchor *}
					<div id="comment-{$comments.id}" class="comment">
						<div class="imageHolder">
							{option:comments.website}<a href="{$comments.website}">{/option:comments.website}
								<img src="{$FRONTEND_CORE_URL}/layout/images/default_author_avatar.gif" alt="{$comments.author}" class="replaceWithGravatar" data-gravatar-id="{$comments.gravatar_id}" />
							{option:comments.website}</a>{/option:comments.website}

							<div class="commentMeta">
								<h3>{option:comments.website}<a href="{$comments.website}">{/option:comments.website}{$comments.author}{option:comments.website}</a>{/option:comments.website}</h3>

								<p class="commentAuthor">
									{$lblWrote}
									{$comments.created_on|timeago}
								</p>
							</div>
						</div>
						<div class="commentContent">
							<div class="commentText content">
								{$comments.text|cleanupplaintext}
							</div>
						</div>
					</div>
				{/iteration:comments}
			</div>
		</div>
	</section>
{/option:comments}
{option:item.allow_comments}
	<header>
		<div class="sectionTitle">
			<h2 id="{$actComments}"><span>{$msgComment|ucfirst}</span></h2>
		</div>
	</header>
	<section id="blogCommentForm" class="mod">
		<div class="inner">
			<div class="bd">
				{option:commentIsInModeration}<div class="message warning"><p>{$msgBlogCommentInModeration}</p></div>{/option:commentIsInModeration}
				{option:commentIsSpam}<div class="message error"><p>{$msgBlogCommentIsSpam}</p></div>{/option:commentIsSpam}
				{option:commentIsAdded}<div class="message success"><p>{$msgBlogCommentIsAdded}</p></div>{/option:commentIsAdded}
				{form:comment}
					<p {option:txtAuthorError}class="errorArea"{/option:txtAuthorError}>
						<label for="author">{$lblName|ucfirst}<abbr title="{$lblRequiredField}">*</abbr></label>
						{$txtAuthor} {$txtAuthorError}
					</p>
					<p {option:txtEmailError}class="errorArea"{/option:txtEmailError}>
						<label for="email">{$lblEmail|ucfirst}<abbr title="{$lblRequiredField}">*</abbr></label>
						{$txtEmail} {$txtEmailError}
					</p>
					<p class="bigInput{option:txtWebsiteError} errorArea{/option:txtWebsiteError}">
						<label for="website">{$lblWebsite|ucfirst}</label>
						{$txtWebsite} {$txtWebsiteError}
					</p>
					<p class="bigInput{option:txtMessageError} errorArea{/option:txtMessageError}">
						<label for="message" class="lblMessage">{$lblMessage|ucfirst}<abbr title="{$lblRequiredField}">*</abbr></label>
						{$txtMessage} {$txtMessageError}
					</p>
					<p>
						<input class="inputSubmit" type="submit" name="comment" value="{$msgComment|ucfirst}" />
					</p>
				{/form:comment}
			</div>
		</div>
	</section>
{/option:item.allow_comments}