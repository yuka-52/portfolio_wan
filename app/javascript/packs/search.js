$(function(){
  $('.subimage li').hover(function(){
        //オーバーしたliのインデックスを取得
        var index = $('.subimage li').index(this);
        //オーバーした画像URLを取得
        var imageurl = $('.subimage li').eq(index).find('img').attr('src');;
        //ulのクラス名を取得（空白で分割）
        className = $(this).parent().attr('class').split(" ");
        //元のメイン画像を保存しておく
        defaultImage = $('image_tag.searchshow_image.'+className[1]).attr('src');;
        $('img.searchshow_image.'+className[1]).attr('src',imageurl);
    },function(){
        $('img.searchshow_image.'+className[1]).attr('src',defaultImage);
    });
});
