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

<script src="<?php echo site_url("assets/" . ADMIN_DIR . "js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"); ?>"></script>

<link href="<?php echo site_url("assets/" . ADMIN_DIR . "font-awesome/css/font-awesome.min.css"); ?>" rel="stylesheet" />
<script src="<?php echo site_url("assets/" . ADMIN_DIR . "js/script.js"); ?>"></script>
<script type="text/javascript">
	jQuery(document).ready(function() {
			App.setPage("widgets_box");
			App.init();
		}

	);
</script>
</body>

</html>