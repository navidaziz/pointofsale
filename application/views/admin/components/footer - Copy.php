<div class="separator"></div>
</div>
</div>
</div>
</div>
</section>


<style>
	.printDiv {
		display: none;
	}

	@media print {

		.printDiv {
			display: block;
		}
	}
</style>


<script type="text/javascript" src="<?php echo site_url("assets/" . ADMIN_DIR); ?>/js/magic-suggest/magicsuggest-1.3.1-min.js"></script>
<script src="<?php echo site_url("assets/" . ADMIN_DIR . "js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"); ?>"></script>
<script src="<?php echo site_url("assets/" . ADMIN_DIR . "js/scr ipt.js"); ?>"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
			App.setPage("widgets_box");
			App.init();
		}

	);
</script>
<link href="<?php echo site_url("assets/" . ADMIN_DIR . "font-awesome/css/font-awesome.min.css"); ?>" rel="stylesheet" />

<script type="text/javascript" src="<?php echo site_url("assets/" . ADMIN_DIR); ?>/js/timeago/jquery.timeago.min.js"></script>

<link rel="stylesheet" type="text/css" href="<?php echo site_url("assets/" . ADMIN_DIR . "js/magic-suggest/magicsuggest-1.3.1-min.css"); ?>" />
</body>

</html>