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
    $(this).parent().append("<form method='post' class='envoye_ajax'><input type='text' name='titre' id='titre' placeholder='Titre' value='"+$(this).find('h2 a').text()+"' required><br><textarea name='texte'>"+$(this).find('p').text()+"</textarea><br>\n\
        <input type='submit' value='Envoyer'></form>");
    return false;
});

//envoye formulaire modification texte formation
$(".element_global").on("click", "input[type='submit']",function(){
    console.log($(this).siblings('input[name="titre"]').val());
    val = new Array($(this).siblings('input[name="titre"]').val(),$(this).siblings('textarea[name="texte"]').val());
    colonne = [$(this).siblings('input[name="titre"]').attr('name'), $(this).siblings('textarea[name="texte"]').attr('name')];
    envoye_ajax(val,'texte', colonne,$(this).parent().parent().data('id'));
    $(this).parent().siblings().css('display','block');
    $(this).parent().siblings().find('h2 a').text(val[0]);
    $(this).parent().siblings().find('p').text(val[1]);
    $(this).parent().remove();
    return false;
});