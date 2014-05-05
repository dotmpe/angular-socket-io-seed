define('markdown-editor', ['jquery','markdown'], function($, md) {
  
  console.log(md)
  console.log('markdown=editr');

  function Editor(input, preview) {
    this.update = function () {
      preview.innerHTML = md.toHTML(input.value);
    };
    input.editor = this;
    this.update();
  }
  new Editor($("text-input"), $("preview"));

})
