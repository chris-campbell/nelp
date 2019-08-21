App.tally = App.cable.subscriptions.create('TallyChannel',{
  connected() {},
  disconnected() {},
  received(data) {
    if (data) {
      const placeID = data.place_id;
      let scoreElement = $('.score-value[data-score=' + placeID + ']')
      $(scoreElement[0]).replaceWith("<span class='score-value' data-score='"
                                + placeID + "'>" + data.content +
                                 "%<br><span class='total-score'>Vote count: " +
                                 data.score + "</span></span>");
    }
  }
}
);
