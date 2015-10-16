function cree_xhr(){
    var sortie_xhr;
    if(window.XMLHttpRequest){
        sortie_xhr = new XMLHttpRequest();
        if(sortie_xhr.overrideMimeType){
            sortie_xhr.overrideMimeType('text/xml');
        }
    }else{
        if(window.ActiveXObjet){
            try{
                sortie_xhr= new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    sortie_xhr= new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    sortie_xhr=null;
                }
            }
        }
    }
    return sortie_xhr;
};


//EXEMPLE
function envoye_ajax(value,table,colonne,condition){
    var req_xhr = cree_xhr();
    if (req_xhr===null){
        alert("Votre navigateur ne supporte pas Ajax");
    }
    else{
        
        req_xhr.open('POST',"../include/envoyeAjax.php",true);
        req_xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        
        req_xhr.onreadystatechange = function(){
            
            if (req_xhr.readyState===4 && req_xhr.status === 200) {
               
                if(req_xhr.responseText !=='Mise à jour réussie'){
                    console.log(req_xhr.responseText);
                    alert('Mise à jour échouée, veuillez recomencer');
                }
            }
        };
        var compt_val = value.length;
        var chaine ="?";
        for(var i = 0 ; i < compt_val ; i++){
            chaine+="&value[]="+value[i];
        }
        
        chaine+= "&table="+table;
        
        for(var i = 0 ; i < compt_val ; i++){
            chaine+="&colonne[]="+colonne[i];
        }
        
        chaine+= "&condition="+condition;
                
        req_xhr.send(chaine);
    }
}

//aparition formulaire de connexion
$('a.connexion').click(function(){
    $('div.login').toggle();
    return false;
});

//aparition formulaire modification texte formation
$('.editable:not(".info")').dblclick(function(){
    $('.editable').css('display','block');
    $(this).css('display','none');
    $('.element_global').children('form').remove();
    $(this).parent().append("<form method='post' class='envoye_ajax'><input type='text' name='titre' id='new_titre' placeholder='Titre' value='"+$(this).find('h2 a').text()+"' required><br><textarea name='texte'>"+$(this).find('p').text()+"</textarea><br>\n\
        <input type='submit' value='Envoyer'></form>");
    return false;
});

//envoye formulaire modification texte formation
$(".element_global").on("click", "input[type='submit']",function(){
    console.log($(this).siblings('input[name="titre"]').val());
    val = new Array($(this).siblings('input[name="titre"]').val(),$(this).siblings('textarea[name="texte"]').val());
    colonne = [$(this).siblings('input[name="titre"]').attr('name'), $(this).siblings('textarea[name="texte"]').attr('name')];
    var result = envoye_ajax(val,'texte', colonne,$(this).parent().parent().data('id'));
    console.log(result);
    $(this).parent().siblings().css('display','block');
    $(this).parent().siblings().find('h2 a').text(val[0]);
    $(this).parent().siblings().find('p').text(val[1]);
    $(this).parent().remove();
    return false;
});

//click bouton modifier 
$(".edit").click(function(){
    var url = window.location.href;
    
    //get delete existe
    if(url.indexOf('&edit=')!=-1){
        
        var get_delete = url.substr(0,url.indexOf('&edit='));
        window.location.href=(get_delete+'&edit='+$(this).data('id'));
        console.log(get_delete+'&edit='+$(this).data('id'));
        
    //get delete existe pas
    }else{
        var get = url.substr(url.indexOf('?menu'));
        window.location.href=(get+'&edit='+$(this).data('id'));
    }
});

//click bouton supprimer elements page
$(".delete_form").click(function(){
    if(confirm('Voulez vous supprimer la formation: "'+$(this).data('titre')+'"')){

            var delete_url = window.location.href;
            if(delete_url.search('&delete-form=')!=-1){
               delete_url = delete_url.substring(0,(delete_url.indexOf('&delete-form')));
            }
        window.location.href=(delete_url+'&delete-form='+$(this).data('id'));
    }
    else
        console.log(window.location.href);
});

//click bouton supprimer elements page
$(".delete").click(function(){
    if(confirm('Voulez vous supprimer : "'+$(this).data('titre')+'"')){

            var delete_url = window.location.href;
            if(delete_url.search('&delete=')!=-1){
               delete_url = delete_url.substring(0,(delete_url.indexOf('&delete')));
            }
        window.location.href=(delete_url+'&delete='+$(this).data('id'));
    }
    else
        console.log(window.location.href);
});

//Eric work - On caache la zone de texte
jQuery('#toggle').hide();

jQuery('.middle-content .demploi a').mouseover(function()
{
    jQuery(this).parent().siblings('.toggle').show(500);
    jQuery(this).parent().parent().siblings().find('.toggle').hide(500);
    return false;
});

jQuery('.middle-content .patron a').mouseover(function()
{
    jQuery(this).parent().siblings('.toggle').show(500);
    jQuery(this).parent().parent().siblings().find('.toggle').hide(500);
    return false;
});