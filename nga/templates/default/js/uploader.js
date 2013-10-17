$(document).ready(function() {
    var errorHandler = function(event, id, fileName, reason) {
        //qq.log("id: " + id + ", fileName: " + fileName + ", reason: " + reason);
    };

    var fileNum = 0;

    $('.multiupload').fineUploader({
        debug: false,
        request: {
            endpoint: "/services/photoUpload.php",
            paramsInBody: true,
            params: {
                test: 'one',
                blah: 'foo',
                bar: {
                    one: '1',
                    two: '2',
                    three: {
                        foo: 'bar'
                    }
                },
                fileNum: function() {
                    fileNum+=1;
                    return fileNum;
                }
            }
        },
        validation: {
            allowedExtensions: ['jpeg', 'jpg', 'png', 'gif'],
            sizeLimit: 8000000
        }
    })
        //.on('error', errorHandler)
        .on('complete', function(event, id, filename, responseJSON){
            $('.subiframe').each(function() {
              this.contentWindow.location.reload(true);
            });
            //console.log(id);

            //setTimeout('window.location.reload()',2500);
            //$('.multiupload').append('<li><span class="upload_thumb"><img src = "/_files/gallery/thumb/'+filename+'" /></span><span><input type="text" placeholder="Название" /></span></li>');

            //do something
          });
});
