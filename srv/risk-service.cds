using { sap.ui.riskmanagement as my } from '../db/schema';

@path: 'service/risk'
service RiskService {
  entity Risks as projection on my.Risks
    actions {
      @cds.odata.bindingparameter.name : '_it'
      @Common.SideEffects : {
        TargetProperties : ['_it/impact']
      }
      @Common.IsActionCritical : true
      action increaseImpact();
    }
    annotate Risks with @odata.draft.enabled;
  entity Mitigations as projection on my.Mitigations;
    annotate Mitigations with @odata.draft.enabled;
}