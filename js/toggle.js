// JavaScript Document
//Affiche et cache la description des sections demandeur d'emploi et employeurs

jQuery(document).ready(function() {
	//On caache la zone de texte
	jQuery('#toggle').hide();
	
	jQuery('.middle-content .demploi a').mouseover(function()
	{
		jQuery(this).parent().siblings('.toggle').show(500);
		jQuery(this).parent().parent().siblings().find('.toggle').hide(500);
		return false;
	})
	
	jQuery('.middle-content .patron a').mouseover(function()
	{
		jQuery(this).parent().siblings('.toggle').show(500);
		jQuery(this).parent().parent().siblings().find('.toggle').hide(500);
		return false;
	})
    
});

$('<strong>lololol</strong>').prependTo('.page-web-onglet');
