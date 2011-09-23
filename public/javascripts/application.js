// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// functions for sales_orders/new.html.erb
	function recalculate_total_price(e) {
		quantity = $(e.id).up('tr').down('.quantity').value;
		unit_price = $(e.id).up('tr').down('.unit_price').value;
		
		if ( (!$(e.id).up('tr').down('.total_taxes').value) || ($(e.id).up('tr').down('.total_taxes').value == "null") ) {
			$(e.id).up('tr').down('.total_taxes').value = 0;
		}		
		total_taxes = $(e.id).up('tr').down('.total_taxes').value;

		total_price = quantity * unit_price + quantity * unit_price * total_taxes / 100 ;
		$(e.id).up('tr').down('.total_price').value = total_price.toFixed(2);
		
		var total = 0;
		var products = $$('form .product_id');
		for (var i = 0; i < products.length; i++) {
			total += Number($(products[i].id).up('tr').down('.total_price').value);
		}
		$('total').update(total.toFixed(2));
	}
	
	function blank_unused_sales_line_items() {
		var products = $$('form .product_id');
		var empty_products = 0;		
		for (var i = 0; i < products.length; i++) {
			var tr = $(products[i].id).up('tr');
			if ( tr.down('.product_id').value == "" & tr.down('.quantity').value == "" & tr.down('.unit_price').value == "" ) 
				empty_products ++ ;				
		}
		if (empty_products < products.length) {
			for ( var i = 0; i < products.length; i++ ) {
				var tr = $(products[i].id).up('tr');
				if ( tr.down('.product_id').value == "" & tr.down('.quantity').value == "" & tr.down('.unit_price').value == "" ) {
					tr.down('.product_id').id = "";
					tr.down('.product_id').name = "";
					tr.down('.quantity').id = "";
					tr.down('.quantity').name = "";
					tr.down('.unit_price').id = "";
					tr.down('.unit_price').name = "";
					tr.down('.total_price').id = "";
					tr.down('.total_price').name = "";
				}
			}			
		}		
	}

// functions for purchase_orders/new.html.erb	
	function recalculate_total_cost(e) {
		quantity = $(e.id).up('tr').down('.quantity').value;
		unit_cost = $(e.id).up('tr').down('.unit_cost').value;
		$(e.id).up('tr').down('.total_cost').value = (quantity * unit_cost).toFixed(2);
		
		var total = 0;
		var products = $$('form .product_id');
		for (var i = 0; i < products.length; i++) {
			total += Number($(products[i].id).up('tr').down('.total_cost').value);
		}
		$('total').update(total.toFixed(2));
	}
	
	function blank_unused_purchase_line_items() {
		var products = $$('form .product_id');
		var empty_products = 0;		
		for (var i = 0; i < products.length; i++) {
			var tr = $(products[i].id).up('tr');
			if ( tr.down('.product_id').value == "" & tr.down('.quantity').value == "" & tr.down('.unit_cost').value == "" ) 
				empty_products ++ ;				
		}
		if (empty_products < products.length) {
			for ( var i = 0; i < products.length; i++ ) {
				var tr = $(products[i].id).up('tr');
				if ( tr.down('.product_id').value == "" & tr.down('.quantity').value == "" & tr.down('.unit_cost').value == "" ) {
					tr.down('.product_id').id = "";
					tr.down('.product_id').name = "";
					tr.down('.quantity').id = "";
					tr.down('.quantity').name = "";
					tr.down('.unit_cost').id = "";
					tr.down('.unit_cost').name = "";
					tr.down('.total_cost').id = "";
					tr.down('.total_cost').name = "";
				}
			}			
		}		
	}