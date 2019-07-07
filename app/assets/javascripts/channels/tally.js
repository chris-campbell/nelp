App.tally = App.cable.subscriptions.create("TallyChannel", {
  connected() {},


  disconnected() {},


  received(data) {
    if (data) {
      $('.score-value').replaceWith("<span class='score-value'>" + data.content + "%</span>")
    }
  }
});
