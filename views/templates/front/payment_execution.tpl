{capture name=path}
	<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}" title="{l s='Go back to the Checkout' mod='bankSCB'}">{l s='Checkout' mod='bankSCB'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s='Bank-wire payment' mod='bankSCB'}
{/capture}

<h2>{l s='Order summary' mod='bankSCB'}</h2>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
	<p class="warning">{l s='Your shopping cart is empty.' mod='bankSCB'}</p>
{else}
	
	<div class="scb-bank-container text-center">
		<div class="row">
			<div class="col-sm-8 col-md-6 col-centered">
				<div class="box-wrapper">
					<h2>{l s='Siam Commercial Bank' mod='bankSCB'}</h2>
					<form action="{$link->getModuleLink('bankSCB', 'validation', [], true)|escape:'html'}" method="post">
						<img src="{$this_path_bw}bank-logo.jpg" alt="{l s='SCB Logo' mod='bankSCB'}" class="_logo" />
						<h3 class="_title">{l s='You have chosen to pay by SCB' mod='bankSCB'}</h3>
						<p class="_lead">{l s='Here is a short summary of your order' mod='bankSCB'}</p>
						
						<div class="dashed"></div>
						
						<p class="_summary">
							{l s='The total amount of your order is' mod='bankSCB'}
							<span class="__price">{displayPrice price=$total}</span>
							<span class="__item">- {$nbProducts} {l s='items' mod='bankSCB'}</span>
						</p>
						{if $use_taxes == 1}
							<small>{l s='(tax incl.)' mod='bankSCB'}</small>
						{/if}

						<p class="_more">
							{l s='Bank account information will be displayed on the next page.' mod='bankSCB'} {l s='Please confirm your order by clicking "I confirm my order".' mod='bankSCB'}
						</p>

						<div class="cart_navigation" id="cart_navigation">
							<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html'}" class="btn btn-default btn-lg" style="margin-right: 10px">{l s='Other payment methods' mod='bankSCB'}</a>
							<input type="submit" value="{l s='I confirm my order' mod='bankSCB'}" class="btn btn-success btn-lg" />
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

{/if}

<script>
	$(document).ready(function(){
		$('#left_column').remove();
		$('#center_column').attr('class', 'col-xs-12 center-column');
	})
</script>