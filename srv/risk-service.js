const cds = require('@sap/cds');
module.exports = function (srv) {
    const { Risks } = srv.entities('RiskService');
    srv.on('increaseImpact', Risks, async req => {

        //get the id of the entity that is to be updated
        const param = req.params[0];
        const id = param.ID;

        //do the update
        const tx = cds.transaction(req);
        return tx.run([
            UPDATE(Risks).set({ impact: { '+=': 500 } }).where({ ID: id })
        ])
    })
};