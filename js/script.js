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
    var reponse = 'false';
    if (req_xhr===null){
        alert("Votre navigateur ne supporte pas Ajax");
    }
    else{
        
        req_xhr.open('POST',"../include/envoyeAjax.php",true);
        req_xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        
        req_xhr.onreadystatechange = function(){
            
            if (req_xhr.readyState===4 && req_xhr.status === 200) {
               
                console.log(req_xhr.responseText);
                reponse = value;
            }
        };
       
        req_xhr.send("value="+value+"&table="+table+"&colonne="+colonne+"&condition="+condition);
    }
    return (!reponse)? 'ko' :reponse;
}

//aparition formulaire de connexion
$('a.connexion').click(function(){
    $('div.login').toggle();
    return false;
});

$('.editable:not(".info")').dblclick(function(){
    $('.editable').css('display','block');
    $(this).css('display','none');
    $('.element_global').children('form').remove();
    $(this).parent().append("<form method='post' class='envoye_ajax'><input type='text' name='titre' id='titre' placeholder='Titre' value='"+$(this).find('h2 a').text()+"' required><br><textarea name='text'>"+$(this).find('p').text()+"</textarea><br>\n\
        <input onclick='console.log($(this).prev().prev().prev().prev().val());  return false;' type='submit' value='Envoyer'></form>");
    return false;
});

//envoye_ajax('"+$(this).siblings('input[name="titre"]').val()+"','texte','titre',condition);