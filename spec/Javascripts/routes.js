it('triggers the "email_template" route', function () {
    var email_template = spyOn(router, 'email_template').andCallThrough();

    if (Backbone.history._hasPushState) {
        pushStateSpy = spyOn(window.history, 'pushState').andCallFake(function (data, title, url) {
            expect(url).toEqual('/campaigns/:campaign_id/email_template/new');
            router.email_template();
        });
        router.navigate('/campaigns/:campaign_id/email_template/new', {trigger: true});
        expect(pushStateSpy).toHaveBeenCalled();
        expect(email_template).toHaveBeenCalled();

    } else if (Backbone.history._wantsHashChange) {
        var updateHashSpy = spyOn(Backbone.history, '_updateHash').andCallFake(function (loc, frag) {
            expect(frag).toEqual('');
            router.email_template();
        });
        router.navigate('', {trigger: true});
        expect(updateHashSpy).toHaveBeenCalled();
        expect(email_template).toHaveBeenCalled();
    }
});