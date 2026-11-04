**v12_dy_mc.root (14.923 Mb, 9925 events, 1.54 kb/event)**

# Runs Content

| Collection | Description | kb/evt | % of tree |
| - | - | - | - |
| **LHEPdfSumw** | Sum of genEventWeight * LHEPdfWeight[i], divided by genEventSumw | 0.000| 53.7%|
| **LHEScaleSumw** | Sum of genEventWeight * LHEScaleWeight[i], divided by genEventSumw | 0.000| 14.3%|
| **PSSumw** | Sum of genEventWeight * PSWeight[i], divided by genEventSumw | 0.000| 11.7%|
| **genEventCount** | event count | 0.000| 5.3%|
| **genEventSumw** | sum of gen weights | 0.000| 5.2%|
| **genEventSumw2** | sum of gen (weight^2) | 0.000| 5.3%|
| **run** | run/i | 0.000| 4.4%|

# Runs detail

### LHEPdfSumw
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **LHEPdfSumw** | Double_t| Sum of genEventWeight * LHEPdfWeight[i], divided by genEventSumw | 0.1| 7.9| 90.8%|
| **nLHEPdfSumw** | Int_t| Number of entries in LHEPdfSumw | 0.0| 0.8| 9.2%|

### LHEScaleSumw
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **LHEScaleSumw** | Double_t| Sum of genEventWeight * LHEScaleWeight[i], divided by genEventSumw | 0.0| 19.4| 64.9%|
| **nLHEScaleSumw** | Int_t| Number of entries in LHEScaleSumw | 0.0| 10.5| 35.1%|

### PSSumw
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **PSSumw** | Double_t| Sum of genEventWeight * PSWeight[i], divided by genEventSumw | 0.0| 29.2| 60.0%|
| **nPSSumw** | Int_t| Number of entries in PSSumw | 0.0| 19.5| 40.0%|

### genEventCount
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **genEventCount** | Long64_t| event count | 0.0| 88.0| 100.0%|

### genEventSumw
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **genEventSumw** | Double_t| sum of gen weights | 0.0| 87.0| 100.0%|

### genEventSumw2
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **genEventSumw2** | Double_t| sum of gen (weight^2) | 0.0| 88.0| 100.0%|

### run
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **run** | UInt_t| run/i | 0.0| 74.0| 100.0%|

# LuminosityBlocks Content

| Collection | Description | kb/evt | % of tree |
| - | - | - | - |
| **GenFilter** | generator filter: efficiency | 0.000| 69.0%|
| **luminosityBlock** | luminosityBlock/i | 0.000| 16.1%|
| **run** | run/i | 0.000| 14.9%|

# LuminosityBlocks detail

### GenFilter
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **GenFilter_filterEfficiency** | Float_t| generator filter: efficiency | 0.0| 10.6| 24.9%|
| **GenFilter_filterEfficiencyError** | Float_t| generator filter: efficiency error | 0.0| 10.9| 25.7%|
| **GenFilter_numEventsPassed** | Int_t| generator filter: passed number of events | 0.0| 10.5| 24.8%|
| **GenFilter_numEventsTotal** | Int_t| generator filter: total number of events | 0.0| 10.4| 24.6%|

### luminosityBlock
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **luminosityBlock** | UInt_t| luminosityBlock/i | 0.0| 9.9| 100.0%|

### run
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **run** | UInt_t| run/i | 0.0| 9.1| 100.0%|

# Events Content

| Collection | Description | kb/evt | % of tree |
| - | - | - | - |
| **BeamSpot** | BeamSpot type (Unknown = -1, Fake = 0, LHC = 1, Tracker = 2) | 0.000| 0.0%|
| **CaloMET** | phi | 0.005| 0.4%|
| **ChsMET** | raw chs PF MET phi | 0.005| 0.4%|
| **CorrT1METJet** | Additional low-pt ak4 Puppi jets for Type-1 MET re-correction | 0.020| 1.5%|
| **DeepMETResolutionTune** | DeepmET ResolutionTune phi | 0.006| 0.5%|
| **DeepMETResponseTune** | DeepMET ResponseTune phi | 0.006| 0.5%|
| **Electron** | slimmedElectrons after basic selection (pt > 5 ) | 0.067| 5.2%|
| **FatJet** | slimmedJetsAK8, i.e. ak8 fat jets for boosted analysis | 0.005| 0.4%|
| **Flag** | Trigger/flag bit (process: PAT) | 0.002| 0.1%|
| **FsrPhoton** | Final state radiation photons emitted by muons or electrons | 0.001| 0.1%|
| **GenDressedLepton** | Dressed leptons from Rivet-based ParticleLevelProducer | 0.012| 0.9%|
| **GenIsolatedPhoton** | Isolated photons from Rivet-based ParticleLevelProducer | 0.001| 0.1%|
| **GenJet** | slimmedGenJets, i.e. ak4 Jets made with visible genparticles | 0.036| 2.8%|
| **GenJetAK8** | slimmedGenJetsAK8, i.e. ak8 Jets made with visible genparticles | 0.001| 0.1%|
| **GenMET** | phi | 0.004| 0.3%|
| **GenPart** | interesting gen particles | 0.140| 10.9%|
| **GenProton** | pileup proton? | 0.014| 1.1%|
| **GenVisTau** | gen hadronic taus | 0.005| 0.4%|
| **GenVtx** | gen vertex x | 0.008| 0.6%|
| **Generator** | id of first parton | 0.008| 0.6%|
| **HLT** | Trigger/flag bit (process: HLT) | 0.063| 4.9%|
| **HLTriggerFinalPath** | Trigger/flag bit (process: HLT) | 0.000| 0.0%|
| **HLTriggerFirstPath** | Trigger/flag bit (process: HLT) | 0.000| 0.0%|
| **HTXS** | number of jets with pt>25 GeV as identified in HTXS | 0.001| 0.1%|
| **IsoTrack** | isolated tracks after basic selection (((pt>5 && (abs(pdgId) == 11 \|\| abs(pdgId) == 13)) \|\| pt > 10) && (abs(pdgId) < 15 \|\| abs(eta) < 2.5) && ((abs(dxy) < 0.2 && abs(dz) < 0.1) \|\| pt>15) && ((pfIsolationDR03().chargedHadronIso < 5 && pt < 25) \|\| pfIsolationDR03().chargedHadronIso/pt < 0.2)) and lepton veto | 0.010| 0.8%|
| **Jet** | slimmedJetsPuppi, i.e. ak4 PFJets Puppi with JECs applied, after basic selection (pt > 15) | 0.150| 11.7%|
| **L1** | Trigger/flag bit (process: NANO) | 0.042| 3.2%|
| **L1Reco** | Trigger/flag bit (process: RECO) | 0.000| 0.0%|
| **L1simulation** | Trigger/flag bit (process: HLT) | 0.000| 0.0%|
| **LHE** | Number of jets (partons) at LHE step | 0.007| 0.5%|
| **LHEPart** | PDG ID of LHE particles | 0.042| 3.2%|
| **LHEPdfWeight** | LHE pdf variation weights (w_var / w_nominal) for LHA IDs 325300 - 325402 | 0.110| 8.6%|
| **LHEReweightingWeight** |  | 0.000| 0.0%|
| **LHEScaleWeight** | LHE scale variation weights (w_var / w_nominal); [0] is MUF="0.5" MUR="0.5"; [1] is MUF="1.0" MUR="0.5"; [2] is MUF="2.0" MUR="0.5"; [3] is MUF="0.5" MUR="1.0"; [4] is MUF="2.0" MUR="1.0"; [5] is MUF="0.5" MUR="2.0"; [6] is MUF="1.0" MUR="2.0"; [7] is MUF="2.0" MUR="2.0" | 0.005| 0.4%|
| **LHEWeight** | Nominal event weight in the LHE file | 0.000| 0.0%|
| **LowPtElectron** | slimmedLowPtElectrons after basic selection (pt > 1. && electronID("ID") > -0.25) | 0.052| 4.1%|
| **MET** | Delta (METx_mod-METx) Unclustered Energy Up | 0.024| 1.8%|
| **Muon** | slimmedMuons after basic selection (pt > 15 \|\| (pt > 3 && (passed("CutBasedIdLoose") \|\| passed("SoftCutBasedId") \|\| passed("SoftMvaId") \|\| passed("CutBasedIdGlobalHighPt") \|\| passed("CutBasedIdTrkHighPt")))) | 0.065| 5.1%|
| **OtherPV** | Z position of other primary vertices, excluding the main PV | 0.011| 0.8%|
| **PSWeight** | PS weights (w_var / w_nominal);   [0] is ISR=2 FSR=1; [1] is ISR=1 FSR=2[2] is ISR=0.5 FSR=1; [3] is ISR=1 FSR=0.5; | 0.008| 0.6%|
| **PV** | total number of reconstructed primary vertices | 0.011| 0.9%|
| **Photon** | slimmedPhotons after basic selection (pt > 5 ) | 0.064| 5.0%|
| **Pileup** | the number of pileup interactions that have been added to the event in the current bunch crossing | 0.006| 0.5%|
| **PuppiMET** | phi | 0.031| 2.4%|
| **RawMET** | phi | 0.005| 0.4%|
| **RawPuppiMET** | phi | 0.006| 0.4%|
| **Rho** | rho from all PF Candidates, no foreground removal (for isolation of prompt photons) | 0.020| 1.6%|
| **SV** | secondary vertices from IVF algorithm | 0.019| 1.4%|
| **SoftActivityJet** | jets clustered from charged candidates compatible with primary vertex (charge()!=0 && pvAssociationQuality()>=5 && vertexRef().key()==0) | 0.030| 2.4%|
| **SoftActivityJetHT** | scalar sum of soft activity jet pt, pt>1 | 0.003| 0.3%|
| **SoftActivityJetHT10** | scalar sum of soft activity jet pt , pt >10 | 0.003| 0.2%|
| **SoftActivityJetHT2** | scalar sum of soft activity jet pt, pt >2 | 0.003| 0.3%|
| **SoftActivityJetHT5** | scalar sum of soft activity jet pt, pt>5 | 0.003| 0.3%|
| **SoftActivityJetNjets10** | number of soft activity jet pt, pt >2 | 0.000| 0.0%|
| **SoftActivityJetNjets2** | number of soft activity jet pt, pt >10 | 0.001| 0.1%|
| **SoftActivityJetNjets5** | number of soft activity jet pt, pt >5 | 0.000| 0.0%|
| **SubGenJetAK8** | slimmedGenJetsAK8SoftDropSubJets, i.e. subjets of ak8 Jets made with visible genparticles | 0.001| 0.1%|
| **SubJet** | slimmedJetsAK8, i.e. ak8 fat jets for boosted analysis | 0.002| 0.1%|
| **Tau** | slimmedTaus after basic selection (pt > 18 && ((tauID("decayModeFindingNewDMs") > 0.5 && (tauID("byLooseCombinedIsolationDeltaBetaCorr3Hits") \|\| (tauID("chargedIsoPtSumdR03")+max(0.,tauID("neutralIsoPtSumdR03")-0.072*tauID("puCorrPtSum"))<2.5) \|\| tauID("byVVVLooseDeepTau2017v2p1VSjet") \|\| tauID("byVVVLooseDeepTau2018v2p5VSjet"))) \|\| (?isTauIDAvailable("byPNetVSjetraw")?tauID("byPNetVSjetraw"):-1) > 0.05)) | 0.100| 7.8%|
| **TkMET** | raw track MET phi | 0.006| 0.4%|
| **TrigObj** | charge of associated L1 seed | 0.023| 1.8%|
| **boostedTau** | slimmedBoostedTaus after basic selection (pt > 40 && tauID("decayModeFindingNewDMs") && (tauID("byVVLooseIsolationMVArun2DBoldDMwLT") \|\| tauID("byVVLooseIsolationMVArun2DBnewDMwLT"))) | 0.008| 0.6%|
| **bunchCrossing** | bunchCrossing/i | 0.000| 0.0%|
| **event** | event/l | 0.001| 0.1%|
| **genTtbarId** | ttbar categorization | 0.000| 0.0%|
| **genWeight** | generator weight | 0.000| 0.0%|
| **luminosityBlock** | luminosityBlock/i | 0.000| 0.0%|
| **run** | run/i | 0.000| 0.0%|

# Events detail

### BeamSpot
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **BeamSpot_sigmaZ** | Float_t| Width of BeamSpot in z (cm) | 0.1| 0.1| 20.6%|
| **BeamSpot_sigmaZError** | Float_t| Error on width of BeamSpot in z (cm) | 0.1| 0.1| 21.1%|
| **BeamSpot_type** | Char_t| BeamSpot type (Unknown = -1, Fake = 0, LHC = 1, Tracker = 2) | 0.1| 0.1| 17.6%|
| **BeamSpot_z** | Float_t| BeamSpot center, z coordinate (cm) | 0.1| 0.1| 20.1%|
| **BeamSpot_zError** | Float_t| Error on BeamSpot center, z coordinate (cm) | 0.1| 0.1| 20.6%|

### CaloMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **CaloMET_phi** | Float_t| phi | 2.0| 2.0| 35.1%|
| **CaloMET_pt** | Float_t| pt | 1.9| 1.9| 33.3%|
| **CaloMET_sumEt** | Float_t| scalar sum of Et | 1.8| 1.8| 31.6%|

### ChsMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **ChsMET_phi** | Float_t| raw chs PF MET phi | 2.0| 2.0| 35.6%|
| **ChsMET_pt** | Float_t| raw chs PF MET pt | 1.9| 1.9| 33.4%|
| **ChsMET_sumEt** | Float_t| raw chs PF scalar sum of Et | 1.7| 1.7| 30.9%|

### CorrT1METJet
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **CorrT1METJet_area** | Float_t| jet catchment area, for JECs | 2.2| 1.1| 10.9%|
| **CorrT1METJet_eta** | Float_t| eta | 5.2| 2.7| 25.4%|
| **CorrT1METJet_muonSubtrFactor** | Float_t| 1-(muon-subtracted raw pt)/(raw pt) | 3.5| 1.8| 17.4%|
| **CorrT1METJet_phi** | Float_t| phi | 5.1| 2.6| 25.2%|
| **CorrT1METJet_rawPt** | Float_t| pt()*jecFactor("Uncorrected") | 3.8| 1.9| 18.5%|
| **nCorrT1METJet** | Int_t| Additional low-pt ak4 Puppi jets for Type-1 MET re-correction | 0.5| 0.3| 2.5%|

### DeepMETResolutionTune
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **DeepMETResolutionTune_phi** | Float_t| DeepmET ResolutionTune phi | 2.4| 2.4| 40.0%|
| **DeepMETResolutionTune_pt** | Float_t| DeepMET ResolutionTune pt | 3.6| 3.6| 60.0%|

### DeepMETResponseTune
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **DeepMETResponseTune_phi** | Float_t| DeepMET ResponseTune phi | 2.4| 2.4| 40.1%|
| **DeepMETResponseTune_pt** | Float_t| DeepMET ResponseTune pt | 3.6| 3.6| 59.9%|

### Electron
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Electron_charge** | Int_t| electric charge | 0.6| 1.0| 0.9%|
| **Electron_convVeto** | Bool_t| pass conversion veto | 0.5| 0.8| 0.7%|
| **Electron_cutBased** | UChar_t| cut-based ID RunIII Winter22 (0:fail, 1:veto, 2:loose, 3:medium, 4:tight) | 0.7| 1.1| 1.0%|
| **Electron_cutBased_HEEP** | Bool_t| cut-based HEEP ID | 0.6| 0.9| 0.9%|
| **Electron_deltaEtaSC** | Float_t| delta eta (SC,ele) with sign | 1.9| 2.9| 2.7%|
| **Electron_dr03EcalRecHitSumEt** | Float_t| Non-PF Ecal isolation within a delta R cone of 0.3 with electron pt > 35 GeV | 1.1| 1.7| 1.6%|
| **Electron_dr03HcalDepth1TowerSumEt** | Float_t| Non-PF Hcal isolation within a delta R cone of 0.3 with electron pt > 35 GeV | 1.1| 1.7| 1.6%|
| **Electron_dr03TkSumPt** | Float_t| Non-PF track isolation within a delta R cone of 0.3 with electron pt > 35 GeV | 0.7| 1.1| 1.0%|
| **Electron_dr03TkSumPtHEEP** | Float_t| Non-PF track isolation within a delta R cone of 0.3 with electron pt > 35 GeV used in HEEP ID | 0.6| 1.0| 0.9%|
| **Electron_dxy** | Float_t| dxy (with sign) wrt first PV, in cm | 1.9| 2.9| 2.8%|
| **Electron_dxyErr** | Float_t| dxy uncertainty, in cm | 1.3| 2.0| 1.9%|
| **Electron_dz** | Float_t| dz (with sign) wrt first PV, in cm | 2.0| 3.1| 2.9%|
| **Electron_dzErr** | Float_t| dz uncertainty, in cm | 1.4| 2.1| 2.0%|
| **Electron_eInvMinusPInv** | Float_t| 1/E_SC - 1/p_trk | 2.0| 3.0| 2.9%|
| **Electron_energyErr** | Float_t| energy error of the cluster-track combination | 1.4| 2.2| 2.1%|
| **Electron_eta** | Float_t| eta | 2.1| 3.2| 3.0%|
| **Electron_fsrPhotonIdx** | Short_t(index to Fsrphoton)| Index of the lowest-dR/ET2 among associated FSR photons | 0.5| 0.8| 0.8%|
| **Electron_genPartFlav** | UChar_t| Flavour of genParticle (DressedLeptons for electrons) for MC matching to status==1 electrons or photons: 1 = prompt electron (including gamma*->mu mu), 15 = electron from prompt tau, 22 = prompt photon (likely conversion), 5 = electron from b, 4 = electron from c, 3 = electron from light or unknown, 0 = unmatched | 0.6| 1.0| 0.9%|
| **Electron_genPartIdx** | Short_t(index to Genpart)| Index into genParticle list for MC matching to status==1 electrons or photons | 0.9| 1.4| 1.3%|
| **Electron_hoe** | Float_t| H over E | 1.5| 2.3| 2.1%|
| **Electron_ip3d** | Float_t| 3D impact parameter wrt first PV, in cm | 1.9| 2.9| 2.7%|
| **Electron_isPFcand** | Bool_t| electron is PF candidate | 0.6| 0.9| 0.8%|
| **Electron_jetIdx** | Short_t(index to Jet)| index of the associated jet (-1 if none) | 0.7| 1.1| 1.0%|
| **Electron_jetNDauCharged** | UChar_t| number of charged daughters of the closest jet | 0.7| 1.0| 1.0%|
| **Electron_jetPtRelv2** | Float_t| Relative momentum of the lepton with respect to the closest jet after subtracting the lepton | 1.5| 2.2| 2.1%|
| **Electron_jetRelIso** | Float_t| Relative isolation in matched jet (1/ptRatio-1, pfRelIso04_all if no matched jet) | 1.6| 2.4| 2.3%|
| **Electron_lostHits** | UChar_t| number of missing inner hits | 0.5| 0.8| 0.8%|
| **Electron_mass** | Float_t| mass | 1.3| 2.0| 1.9%|
| **Electron_miniPFRelIso_all** | Float_t| mini PF relative isolation, total (with scaled rho*EA PU Winter22V1 corrections) | 1.8| 2.8| 2.7%|
| **Electron_miniPFRelIso_chg** | Float_t| mini PF relative isolation, charged component | 1.3| 2.1| 2.0%|
| **Electron_mvaHZZIso** | Float_t| HZZ MVA Iso ID score | 2.1| 3.2| 3.1%|
| **Electron_mvaIso** | Float_t| MVA Iso ID score, Winter22V1 | 2.0| 3.0| 2.8%|
| **Electron_mvaIso_WP80** | Bool_t| MVA Iso ID WP80, Winter22V1 | 0.6| 0.9| 0.9%|
| **Electron_mvaIso_WP90** | Bool_t| MVA Iso ID WP90, Winter22V1 | 0.6| 0.9| 0.8%|
| **Electron_mvaNoIso** | Float_t| MVA noIso ID score, Winter22V1 | 2.0| 3.1| 2.9%|
| **Electron_mvaNoIso_WP80** | Bool_t| MVA noIso ID WP80, Winter22V1 | 0.6| 0.9| 0.9%|
| **Electron_mvaNoIso_WP90** | Bool_t| MVA noIso ID WP90, Winter22V1 | 0.6| 0.9| 0.8%|
| **Electron_mvaTTH** | Float_t| TTH MVA lepton ID score | 2.0| 3.1| 3.0%|
| **Electron_pdgId** | Int_t| PDG code assigned by the event reconstruction (not by MC truth) | 0.6| 1.0| 0.9%|
| **Electron_pfRelIso03_all** | Float_t| PF relative isolation dR=0.3, total (with rho*EA PU Winter22V1 corrections) | 2.1| 3.2| 3.1%|
| **Electron_pfRelIso03_chg** | Float_t| PF relative isolation dR=0.3, charged component | 1.8| 2.7| 2.5%|
| **Electron_phi** | Float_t| phi | 2.1| 3.2| 3.0%|
| **Electron_photonIdx** | Short_t(index to Photon)| index of the first associated photon (-1 if none) | 0.7| 1.0| 1.0%|
| **Electron_pt** | Float_t| pt | 2.8| 4.3| 4.1%|
| **Electron_r9** | Float_t| R9 of the supercluster, calculated with full 5x5 region | 1.5| 2.3| 2.2%|
| **Electron_scEtOverPt** | Float_t| (supercluster transverse energy)/pt-1 | 1.6| 2.5| 2.3%|
| **Electron_seedGain** | UChar_t| Gain of the seed crystal | 0.5| 0.7| 0.7%|
| **Electron_seediEtaOriX** | Char_t| iEta or iX of seed crystal. iEta is barrel-only, iX is endcap-only. iEta runs from -85 to +85, with no crystal at iEta=0. iX runs from 1 to 100. | 1.1| 1.7| 1.6%|
| **Electron_seediPhiOriY** | Int_t| iPhi or iY of seed crystal. iPhi is barrel-only, iY is endcap-only. iPhi runs from 1 to 360. iY runs from 1 to 100. | 1.3| 2.0| 1.9%|
| **Electron_sieie** | Float_t| sigma_IetaIeta of the supercluster, calculated with full 5x5 region | 1.7| 2.5| 2.4%|
| **Electron_sip3d** | Float_t| 3D impact parameter significance wrt first PV, in cm | 1.8| 2.8| 2.7%|
| **Electron_svIdx** | Short_t(index to Sv)| index of matching secondary vertex | 0.5| 0.8| 0.8%|
| **Electron_tightCharge** | UChar_t| Tight charge criteria (0:none, 1:isGsfScPixChargeConsistent, 2:isGsfCtfScPixChargeConsistent) | 0.6| 0.9| 0.8%|
| **Electron_vidNestedWPBitmap** | Int_t| VID compressed bitmap (MinPtCut,GsfEleSCEtaMultiRangeCut,GsfEleEBEECut,GsfEleEBEECut,GsfEleEBEECut,GsfEleHadronicOverEMEnergyScaledCut,GsfEleEBEECut,GsfEleRelPFIsoScaledCut,GsfEleConversionVetoCut,GsfEleMissingHitsCut), 3 bits per cut | 1.1| 1.7| 1.6%|
| **Electron_vidNestedWPBitmapHEEP** | Int_t| VID compressed bitmap (MinPtCut,GsfEleSCEtaMultiRangeCut,GsfEleEBEECut,GsfEleEBEECut,GsfEleFull5x5SigmaIEtaIEtaWithSatCut,GsfEleFull5x5E2x5OverE5x5WithSatCut,GsfEleHadronicOverEMLinearCut,GsfEleTrkPtIsoCut,GsfEleEmHadD1IsoRhoCut,GsfEleDxyCut,GsfEleMissingHitsCut,GsfEleEcalDrivenCut), 1 bits per cut | 1.0| 1.6| 1.5%|
| **nElectron** | Int_t| slimmedElectrons after basic selection (pt > 5 ) | 0.3| 0.5| 0.5%|

### FatJet
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **FatJet_area** | Float_t| jet catchment area, for JECs | 0.1| 14.4| 2.0%|
| **FatJet_btagDDBvLV2** | Float_t| DeepDoubleX V2(mass-decorrelated) discriminator for H(Z)->bb vs QCD | 0.1| 16.0| 2.2%|
| **FatJet_btagDDCvBV2** | Float_t| DeepDoubleX V2 (mass-decorrelated) discriminator for H(Z)->cc vs H(Z)->bb | 0.1| 15.8| 2.2%|
| **FatJet_btagDDCvLV2** | Float_t| DeepDoubleX V2 (mass-decorrelated) discriminator for H(Z)->cc vs QCD | 0.1| 16.0| 2.2%|
| **FatJet_btagDeepB** | Float_t| DeepCSV b+bb tag discriminator | 0.1| 15.8| 2.2%|
| **FatJet_btagHbb** | Float_t| Higgs to BB tagger discriminator | 0.1| 12.5| 1.7%|
| **FatJet_electronIdx3SJ** | Short_t(index to Electron)| index of electron matched to jet | 0.1| 13.3| 1.8%|
| **FatJet_eta** | Float_t| eta | 0.1| 15.8| 2.2%|
| **FatJet_genJetAK8Idx** | Short_t(index to Genjetak8)| index of matched gen AK8 jet | 0.1| 13.1| 1.8%|
| **FatJet_hadronFlavour** | UChar_t| flavour from hadron ghost clustering | 0.1| 12.9| 1.8%|
| **FatJet_jetId** | UChar_t| Jet ID flags bit1 is loose (always false in 2017 since it does not exist), bit2 is tight, bit3 is tightLepVeto | 0.1| 12.6| 1.7%|
| **FatJet_lsf3** | Float_t| Lepton Subjet Fraction (3 subjets) | 0.1| 14.4| 2.0%|
| **FatJet_mass** | Float_t| mass | 0.1| 15.4| 2.1%|
| **FatJet_msoftdrop** | Float_t| Corrected soft drop mass with PUPPI | 0.1| 15.5| 2.1%|
| **FatJet_muonIdx3SJ** | Short_t(index to Muon)| index of muon matched to jet | 0.1| 13.1| 1.8%|
| **FatJet_n2b1** | Float_t| N2 with beta=1 (for jets with raw pT>250 GeV) | 0.1| 14.7| 2.0%|
| **FatJet_n3b1** | Float_t| N3 with beta=1 (for jets with raw pT>250 GeV) | 0.1| 13.5| 1.8%|
| **FatJet_nBHadrons** | UChar_t| number of b-hadrons | 0.1| 12.5| 1.7%|
| **FatJet_nCHadrons** | UChar_t| number of c-hadrons | 0.1| 12.7| 1.7%|
| **FatJet_nConstituents** | UChar_t| Number of particles in the jet | 0.1| 13.7| 1.9%|
| **FatJet_particleNetWithMass_H4qvsQCD** | Float_t| ParticleNet tagger (w/ mass) H(->VV->qqqq) vs QCD discriminator | 0.1| 16.8| 2.3%|
| **FatJet_particleNetWithMass_HbbvsQCD** | Float_t| ParticleNet tagger (w/mass) H(->bb) vs QCD discriminator | 0.1| 16.9| 2.3%|
| **FatJet_particleNetWithMass_HccvsQCD** | Float_t| ParticleNet tagger (w/mass) H(->cc) vs QCD discriminator | 0.1| 16.7| 2.3%|
| **FatJet_particleNetWithMass_QCD** | Float_t| ParticleNet tagger (w/ mass) QCD(bb,cc,b,c,others) sum | 0.1| 16.3| 2.2%|
| **FatJet_particleNetWithMass_TvsQCD** | Float_t| ParticleNet tagger (w/ mass) top vs QCD discriminator | 0.1| 16.9| 2.3%|
| **FatJet_particleNetWithMass_WvsQCD** | Float_t| ParticleNet tagger (w/ mass) W vs QCD discriminator | 0.1| 16.8| 2.3%|
| **FatJet_particleNetWithMass_ZvsQCD** | Float_t| ParticleNet tagger (w/ mass) Z vs QCD discriminator | 0.1| 16.6| 2.3%|
| **FatJet_particleNet_QCD** | Float_t| ParticleNet tagger QCD(0+1+2HF) sum | 0.1| 15.4| 2.1%|
| **FatJet_particleNet_QCD0HF** | Float_t| ParticleNet tagger QCD 0 HF (b/c) score | 0.1| 15.6| 2.1%|
| **FatJet_particleNet_QCD1HF** | Float_t| ParticleNet tagger QCD 1 HF (b/c) score | 0.1| 15.6| 2.1%|
| **FatJet_particleNet_QCD2HF** | Float_t| ParticleNet tagger QCD 2 HF (b/c) score | 0.1| 15.6| 2.1%|
| **FatJet_particleNet_XbbVsQCD** | Float_t| ParticleNet X->bb vs. QCD score: Xbb/(Xbb+QCD) | 0.1| 15.8| 2.2%|
| **FatJet_particleNet_XccVsQCD** | Float_t| ParticleNet X->cc vs. QCD score: Xcc/(Xcc+QCD) | 0.1| 15.8| 2.2%|
| **FatJet_particleNet_XggVsQCD** | Float_t| ParticleNet X->gg vs. QCD score: Xgg/(Xgg+QCD) | 0.1| 15.8| 2.2%|
| **FatJet_particleNet_XqqVsQCD** | Float_t| ParticleNet X->qq (uds) vs. QCD score: Xqq/(Xqq+QCD) | 0.1| 15.8| 2.2%|
| **FatJet_particleNet_XteVsQCD** | Float_t| ParticleNet X->e tau_h vs. QCD score: Xte/(Xte+QCD) | 0.1| 15.8| 2.2%|
| **FatJet_particleNet_XtmVsQCD** | Float_t| ParticleNet X->mu tau_h vs. QCD score: Xtm/(Xtm+QCD) | 0.1| 15.6| 2.1%|
| **FatJet_particleNet_XttVsQCD** | Float_t| ParticleNet X->tau_h tau_h vs. QCD score: Xtt/(Xtt+QCD) | 0.1| 15.8| 2.2%|
| **FatJet_particleNet_massCorr** | Float_t| ParticleNet mass regression, relative correction to JEC-corrected jet mass (no softdrop) | 0.1| 15.2| 2.1%|
| **FatJet_phi** | Float_t| phi | 0.1| 15.7| 2.1%|
| **FatJet_pt** | Float_t| pt | 0.1| 15.0| 2.0%|
| **FatJet_rawFactor** | Float_t| 1 - Factor to get back to raw pT | 0.1| 14.6| 2.0%|
| **FatJet_subJetIdx1** | Short_t(index to Subjet)| index of first subjet | 0.1| 13.2| 1.8%|
| **FatJet_subJetIdx2** | Short_t(index to Subjet)| index of second subjet | 0.1| 13.4| 1.8%|
| **FatJet_tau1** | Float_t| Nsubjettiness (1 axis) | 0.1| 15.4| 2.1%|
| **FatJet_tau2** | Float_t| Nsubjettiness (2 axis) | 0.1| 15.2| 2.1%|
| **FatJet_tau3** | Float_t| Nsubjettiness (3 axis) | 0.1| 15.4| 2.1%|
| **FatJet_tau4** | Float_t| Nsubjettiness (4 axis) | 0.1| 15.4| 2.1%|
| **nFatJet** | Int_t| slimmedJetsAK8, i.e. ak8 fat jets for boosted analysis | 0.1| 10.1| 1.4%|

### Flag
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Flag_BadChargedCandidateFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.1%|
| **Flag_BadChargedCandidateSummer16Filter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.2%|
| **Flag_BadPFMuonDzFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 2.9%|
| **Flag_BadPFMuonFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 2.9%|
| **Flag_BadPFMuonSummer16Filter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.0%|
| **Flag_CSCTightHalo2015Filter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 4.2%|
| **Flag_CSCTightHaloFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 4.1%|
| **Flag_CSCTightHaloTrkMuUnvetoFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 6.0%|
| **Flag_EcalDeadCellBoundaryEnergyFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.8%|
| **Flag_EcalDeadCellTriggerPrimitiveFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.2%|
| **Flag_HBHENoiseFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 2.9%|
| **Flag_HBHENoiseIsoFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.0%|
| **Flag_HcalStripHaloFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.0%|
| **Flag_METFilters** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 2.8%|
| **Flag_chargedHadronTrackResolutionFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.2%|
| **Flag_ecalBadCalibFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.0%|
| **Flag_ecalLaserCorrFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 11.9%|
| **Flag_eeBadScFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 2.9%|
| **Flag_globalSuperTightHalo2016Filter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.1%|
| **Flag_globalTightHalo2016Filter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.7%|
| **Flag_goodVertices** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 2.9%|
| **Flag_hcalLaserEventFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.0%|
| **Flag_hfNoisyHitsFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.0%|
| **Flag_muonBadTrackFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.0%|
| **Flag_trkPOGFilters** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 2.9%|
| **Flag_trkPOG_logErrorTooManyClusters** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.1%|
| **Flag_trkPOG_manystripclus53X** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.1%|
| **Flag_trkPOG_toomanystripclus53X** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.1%|

### FsrPhoton
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **FsrPhoton_dROverEt2** | Float_t| deltaR to associated muon divided by photon et2 | 0.2| 9.0| 15.8%|
| **FsrPhoton_electronIdx** | Short_t(index to Electron)| index of associated electron | 0.1| 5.5| 9.7%|
| **FsrPhoton_eta** | Float_t| eta | 0.2| 8.1| 14.2%|
| **FsrPhoton_muonIdx** | Short_t(index to Muon)| index of associated muon | 0.1| 5.5| 9.6%|
| **FsrPhoton_phi** | Float_t| phi | 0.2| 8.1| 14.2%|
| **FsrPhoton_pt** | Float_t| pt | 0.2| 7.5| 13.3%|
| **FsrPhoton_relIso03** | Float_t| relative isolation in a 0.3 cone without CHS | 0.2| 8.8| 15.6%|
| **nFsrPhoton** | Int_t| Final state radiation photons emitted by muons or electrons | 0.1| 4.3| 7.6%|

### GenDressedLepton
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **GenDressedLepton_eta** | Float_t| eta | 2.8| 3.1| 22.6%|
| **GenDressedLepton_hasTauAnc** | Bool_t| true if Dressed lepton has a tau as ancestor | 0.6| 0.7| 5.1%|
| **GenDressedLepton_mass** | Float_t| mass | 1.3| 1.4| 10.4%|
| **GenDressedLepton_pdgId** | Int_t| PDG id | 0.9| 1.0| 7.2%|
| **GenDressedLepton_phi** | Float_t| phi | 2.8| 3.1| 22.3%|
| **GenDressedLepton_pt** | Float_t| pt | 3.7| 4.1| 29.7%|
| **nGenDressedLepton** | Int_t| Dressed leptons from Rivet-based ParticleLevelProducer | 0.3| 0.4| 2.8%|

### GenIsolatedPhoton
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **GenIsolatedPhoton_eta** | Float_t| eta | 0.2| 9.6| 21.9%|
| **GenIsolatedPhoton_mass** | Float_t| mass | 0.2| 8.6| 19.6%|
| **GenIsolatedPhoton_phi** | Float_t| phi | 0.2| 9.6| 21.9%|
| **GenIsolatedPhoton_pt** | Float_t| pt | 0.2| 10.3| 23.5%|
| **nGenIsolatedPhoton** | Int_t| Isolated photons from Rivet-based ParticleLevelProducer | 0.1| 5.7| 13.1%|

### GenJet
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **GenJet_eta** | Float_t| eta | 8.0| 2.6| 21.7%|
| **GenJet_hadronFlavour** | UChar_t| flavour from hadron ghost clustering | 0.9| 0.3| 2.4%|
| **GenJet_mass** | Float_t| mass | 6.3| 2.1| 17.2%|
| **GenJet_partonFlavour** | Short_t| flavour from parton matching | 1.8| 0.6| 5.0%|
| **GenJet_phi** | Float_t| phi | 7.9| 2.6| 21.4%|
| **GenJet_pt** | Float_t| pt | 11.4| 3.7| 30.9%|
| **nGenJet** | Int_t| slimmedGenJets, i.e. ak4 Jets made with visible genparticles | 0.5| 0.2| 1.3%|

### GenJetAK8
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **GenJetAK8_eta** | Float_t| eta | 0.2| 6.9| 17.3%|
| **GenJetAK8_hadronFlavour** | UChar_t| flavour from hadron ghost clustering | 0.1| 4.0| 10.1%|
| **GenJetAK8_mass** | Float_t| mass | 0.2| 6.2| 15.7%|
| **GenJetAK8_partonFlavour** | Short_t| flavour from parton matching | 0.2| 4.7| 11.9%|
| **GenJetAK8_phi** | Float_t| phi | 0.2| 6.9| 17.3%|
| **GenJetAK8_pt** | Float_t| pt | 0.3| 7.6| 19.0%|
| **nGenJetAK8** | Int_t| slimmedGenJetsAK8, i.e. ak8 Jets made with visible genparticles | 0.1| 3.4| 8.7%|

### GenMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **GenMET_phi** | Float_t| phi | 2.0| 2.0| 47.7%|
| **GenMET_pt** | Float_t| pt | 2.2| 2.2| 52.3%|

### GenPart
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **GenPart_eta** | Float_t| eta | 34.3| 1.5| 23.9%|
| **GenPart_genPartIdxMother** | Short_t(index to Genpart)| index of the mother particle | 8.4| 0.4| 5.9%|
| **GenPart_mass** | Float_t| Mass stored for all particles with the exception of quarks (except top), leptons/neutrinos, photons with mass < 1 GeV, gluons, pi0(111), pi+(211), D0(421), and D+(411). For these particles, you can lookup the value from PDG. | 6.9| 0.3| 4.8%|
| **GenPart_pdgId** | Int_t| PDG id | 11.5| 0.5| 8.0%|
| **GenPart_phi** | Float_t| phi | 33.2| 1.4| 23.1%|
| **GenPart_pt** | Float_t| pt | 35.0| 1.5| 24.4%|
| **GenPart_status** | Int_t| Particle status. 1=stable | 6.4| 0.3| 4.4%|
| **GenPart_statusFlags** | UShort_t| gen status flags stored bitwise, bits are: 0 : isPrompt, 1 : isDecayedLeptonHadron, 2 : isTauDecayProduct, 3 : isPromptTauDecayProduct, 4 : isDirectTauDecayProduct, 5 : isDirectPromptTauDecayProduct, 6 : isDirectHadronDecayProduct, 7 : isHardProcess, 8 : fromHardProcess, 9 : isHardProcessTauDecayProduct, 10 : isDirectHardProcessTauDecayProduct, 11 : fromHardProcessBeforeFSR, 12 : isFirstCopy, 13 : isLastCopy, 14 : isLastCopyBeforeFSR, | 7.2| 0.3| 5.0%|
| **nGenPart** | Int_t| interesting gen particles | 0.9| 0.0| 0.6%|

### GenProton
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **GenProton_isPU** | Bool_t| pileup proton? | 0.6| 0.4| 4.4%|
| **GenProton_px** | Float_t| proton horizontal momentum | 3.7| 2.1| 25.0%|
| **GenProton_py** | Float_t| proton vertical momentum | 3.7| 2.1| 24.9%|
| **GenProton_pz** | Float_t| proton longitudinal momentum | 2.7| 1.5| 17.9%|
| **GenProton_vz** | Float_t| proton vertex longitudinal coordinate | 3.6| 2.1| 24.6%|
| **nGenProton** | Int_t|  | 0.5| 0.3| 3.2%|

### GenVisTau
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **GenVisTau_charge** | Short_t| charge | 0.4| 1.3| 8.1%|
| **GenVisTau_eta** | Float_t| eta | 1.0| 2.9| 18.1%|
| **GenVisTau_genPartIdxMother** | Short_t(index to Genpart)| index of the mother particle | 0.6| 1.7| 10.6%|
| **GenVisTau_mass** | Float_t| mass | 0.8| 2.4| 15.0%|
| **GenVisTau_phi** | Float_t| phi | 1.0| 2.8| 17.9%|
| **GenVisTau_pt** | Float_t| pt | 0.9| 2.5| 16.0%|
| **GenVisTau_status** | UChar_t| Hadronic tau decay mode. 0=OneProng0PiZero, 1=OneProng1PiZero, 2=OneProng2PiZero, 10=ThreeProng0PiZero, 11=ThreeProng1PiZero, 15=Other | 0.5| 1.5| 9.3%|
| **nGenVisTau** | Int_t| gen hadronic taus | 0.3| 0.8| 4.9%|

### GenVtx
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **GenVtx_t0** | Float_t| gen vertex t0 | 2.5| 2.5| 31.7%|
| **GenVtx_x** | Float_t| gen vertex x | 1.0| 1.0| 13.3%|
| **GenVtx_y** | Float_t| gen vertex y | 1.4| 1.4| 18.2%|
| **GenVtx_z** | Float_t| gen vertex z | 2.8| 2.8| 36.8%|

### Generator
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Generator_binvar** | Float_t| MC generation binning value | 0.1| 0.1| 0.8%|
| **Generator_id1** | Int_t| id of first parton | 0.6| 0.6| 7.0%|
| **Generator_id2** | Int_t| id of second parton | 0.6| 0.6| 7.0%|
| **Generator_scalePDF** | Float_t| Q2 scale for PDF | 1.9| 1.9| 23.0%|
| **Generator_weight** | Float_t| MC generator weight | 0.1| 0.1| 0.8%|
| **Generator_x1** | Float_t| x1 fraction of proton momentum carried by the first parton | 2.4| 2.4| 30.0%|
| **Generator_x2** | Float_t| x2 fraction of proton momentum carried by the second parton | 2.4| 2.4| 30.0%|
| **Generator_xpdf1** | Float_t| x*pdf(x) for the first parton | 0.1| 0.1| 0.7%|
| **Generator_xpdf2** | Float_t| x*pdf(x) for the second parton | 0.1| 0.1| 0.7%|

### HLT
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **HLT_AK4CaloJet100** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_AK4CaloJet120** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK4CaloJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_AK4CaloJet40** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_AK4CaloJet50** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_AK4CaloJet80** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_AK4PFJet100** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK4PFJet120** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK4PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_AK4PFJet50** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_AK4PFJet80** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_AK8DiPFJet250_250_MassSD30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8DiPFJet250_250_MassSD50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8DiPFJet260_260_MassSD30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8DiPFJet270_270_MassSD30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFHT750_TrimMass50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFHT800_TrimMass50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFHT850_TrimMass50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFHT900_TrimMass50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet140** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet15** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_AK8PFJet200** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet230_SoftDropMass40** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet230_SoftDropMass40_PFAK8ParticleNetBB0p35** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet230_SoftDropMass40_PFAK8ParticleNetTauTau0p30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet25** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet250_SoftDropMass40_PFAK8ParticleNetBB0p35** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet250_SoftDropMass40_PFAK8ParticleNetTauTau0p30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet260** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet275_SoftDropMass40_PFAK8ParticleNetBB0p35** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet275_SoftDropMass40_PFAK8ParticleNetTauTau0p30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet320** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet330_TrimMass30_PFAK8BTagDeepCSV_p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet330_TrimMass30_PFAK8BTagDeepCSV_p17** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet330_TrimMass30_PFAK8BoostedDoubleB_np2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet330_TrimMass30_PFAK8BoostedDoubleB_np4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet330_TrimMass30_PFAK8BoostedDoubleB_p02** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet360_TrimMass30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet380_TrimMass30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet40** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_AK8PFJet400** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet400_MassSD30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet400_SoftDropMass40** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet400_TrimMass30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet420_MassSD30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet420_TrimMass30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet425_SoftDropMass40** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet450** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet450_MassSD30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet450_SoftDropMass40** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet500** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet550** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet60** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_AK8PFJet80** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.2%|
| **HLT_AK8PFJetFwd140** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJetFwd15** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJetFwd200** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJetFwd25** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_AK8PFJetFwd260** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJetFwd320** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJetFwd40** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_AK8PFJetFwd400** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJetFwd450** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJetFwd500** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJetFwd60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_AK8PFJetFwd80** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_BTagMu_AK4DiJet110_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_BTagMu_AK4DiJet170_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_BTagMu_AK4DiJet20_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_BTagMu_AK4DiJet40_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_BTagMu_AK4DiJet70_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_BTagMu_AK4Jet300_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_BTagMu_AK8DiJet170_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_BTagMu_AK8Jet170_DoubleMu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_BTagMu_AK8Jet300_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CDC_L2cosmic_10_er1p0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CDC_L2cosmic_5p5_er1p0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloJet500_NoJetID** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloJet550_NoJetID** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloMET100_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloMET110_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloMET250_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloMET300_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloMET350_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloMET60_DTCluster50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloMET60_DTClusterNoMB1S50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloMET80_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloMET90_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloMHT90** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CascadeMu100** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CscCluster_Loose** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CscCluster_Medium** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CscCluster_Tight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiEle27_WPTightCaloOnly_L1DoubleEG** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.2%|
| **HLT_DiJet110_35_Mjj650_PFMET110** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiJet110_35_Mjj650_PFMET120** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiJet110_35_Mjj650_PFMET130** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiMu4_Ele9_CaloIdL_TrackIdL_DZ_Mass3p8** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiMu9_Ele9_CaloIdL_TrackIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiMu9_Ele9_CaloIdL_TrackIdL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJet15_FBEta3_NoCaloMatched** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_DiPFJet15_NoCaloMatched** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJet25_FBEta3_NoCaloMatched** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJet25_NoCaloMatched** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_DiPFJetAve100_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJetAve140** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJetAve15_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_DiPFJetAve160_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJetAve200** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJetAve220_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJetAve25_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_DiPFJetAve260** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJetAve300_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJetAve320** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJetAve35_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_DiPFJetAve40** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_DiPFJetAve400** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJetAve500** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJetAve60** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_DiPFJetAve60_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPFJetAve80** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DiPFJetAve80_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPhoton10Time1ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPhoton10Time1p2ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPhoton10Time1p4ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPhoton10Time1p6ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPhoton10Time1p8ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPhoton10Time2ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPhoton10_CaloIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_DiPhoton10sminlt0p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPhoton10sminlt0p12** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPhoton10sminlt0p14** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiPhoton10sminlt0p16** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DiSC30_18_EIso_AND_HE_Mass70** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Dimuon0_Jpsi** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Jpsi3p5_Muon2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Jpsi_L1_4R_0er1p5R** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Jpsi_L1_NoOS** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Jpsi_NoVertexing** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Jpsi_NoVertexing_L1_4R_0er1p5R** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Jpsi_NoVertexing_NoOS** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_LowMass** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_LowMass_L1_0er1p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_LowMass_L1_0er1p5R** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_LowMass_L1_4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_LowMass_L1_4R** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_LowMass_L1_TM530** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Upsilon_L1_4p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Upsilon_L1_4p5NoOS** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Upsilon_L1_4p5er2p0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Upsilon_L1_4p5er2p0M** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Upsilon_L1_5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Upsilon_L1_5M** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Upsilon_Muon_L1_TM0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Upsilon_Muon_NoL1Mass** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon0_Upsilon_NoVertexing** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon10_PsiPrime_Barrel_Seagulls** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon10_Upsilon_y1p4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon12_Upsilon_y1p4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon14_Phi_Barrel_Seagulls** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon14_PsiPrime** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon14_PsiPrime_noCorrL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon18_PsiPrime** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon18_PsiPrime_noCorrL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon20_Jpsi_Barrel_Seagulls** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon24_Phi_noCorrL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon24_Upsilon_noCorrL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon25_Jpsi** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Dimuon25_Jpsi_noCorrL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Diphoton20_14_eta1p5_R9IdL_AND_HET_AND_IsoTCaloIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Diphoton20_14_eta1p5_R9IdL_AND_HE_AND_IsoTCaloIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Diphoton22_14_eta1p5_R9IdL_AND_HET_AND_IsoTCaloIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Diphoton22_14_eta1p5_R9IdL_AND_HE_AND_IsoTCaloIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Diphoton30PV_18PV_R9Id_AND_IsoCaloId_AND_HE_R9Id_Mass55** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Diphoton30_18_R9IdL_AND_HE_AND_IsoCaloId** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.2%|
| **HLT_Diphoton30_18_R9IdL_AND_HE_AND_IsoCaloId_Mass55** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Diphoton30_22_R9Id_OR_IsoCaloId_AND_HE_R9Id_Mass90** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Diphoton30_22_R9Id_OR_IsoCaloId_AND_HE_R9Id_Mass95** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle10_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle24_eta2p1_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleEle25_CaloIdL_MW** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.2%|
| **HLT_DoubleEle27_CaloIdL_MW** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.2%|
| **HLT_DoubleEle33_CaloIdL_MW** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleEle4_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle4p5_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle5_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle5p5_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle6_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle6p5_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle7_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle7p5_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle8_CaloIdM_TrackIdM_Mass8_DZ_PFHT350** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle8_CaloIdM_TrackIdM_Mass8_PFHT350** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle8_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle8p5_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle9_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleEle9p5_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleIsoMu20_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleL2Mu10NoVtx_2Cha_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleL2Mu12NoVtx_2Cha_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleL2Mu14NoVtx_2Cha_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleL2Mu23NoVtx_2Cha** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleL2Mu23NoVtx_2Cha_CosmicSeed** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleL2Mu25NoVtx_2Cha** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleL2Mu25NoVtx_2Cha_CosmicSeed** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleL2Mu25NoVtx_2Cha_CosmicSeed_Eta2p4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleL2Mu25NoVtx_2Cha_Eta2p4** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.2%|
| **HLT_DoubleL2Mu30NoVtx_2Cha_CosmicSeed_Eta2p4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleL2Mu30NoVtx_2Cha_Eta2p4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleL2Mu50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleL3Mu16_10NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleL3Mu18_10NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleL3Mu20_10NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleL3dTksMu16_10NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMediumChargedIsoDisplacedPFTauHPS32_Trk1_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMediumChargedIsoPFTauHPS40_Trk1_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleMediumDeepTauPFTauHPS30_L2NN_eta2p1_PFJet60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMediumDeepTauPFTauHPS30_L2NN_eta2p1_PFJet75** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMediumDeepTauPFTauHPS35_L2NN_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleMu20_7_Mass0to30_L1_DM4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu20_7_Mass0to30_L1_DM4EG** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu20_7_Mass0to30_Photon23** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu2_Jpsi_DoubleTkMu0_Phi** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu2_Jpsi_DoubleTrk1_Phi1p05** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu3_DCA_PFMET50_PFMHT60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu3_DZ_PFMET50_PFMHT60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu3_DZ_PFMET70_PFMHT70** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu3_DZ_PFMET90_PFMHT90** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu3_DoubleEle7p5_CaloIdL_TrackIdL_Upsilon** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu3_TkMu_DsTau3Mu** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu3_Trk_Tau3mu** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu3_Trk_Tau3mu_NoL1Mass** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu40NoFiltersNoVtxDisplaced** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu43NoFiltersNoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu48NoFiltersNoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu4_3_Bs** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu4_3_Displaced_Photon4_BsToMMG** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu4_3_Jpsi** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu4_3_LowMass** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu4_3_Photon4_BsToMMG** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu4_JpsiTrkTrk_Displaced** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu4_JpsiTrk_Bc** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu4_Jpsi_Displaced** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu4_Jpsi_NoVertexing** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu4_LowMass_Displaced** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu4_Mass3p8_DZ_PFHT350** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu4_MuMuTrk_Displaced** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMu5_Upsilon_DoubleEle3_CaloIdL_TrackIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets100_PFBTagDeepCSV_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets100_PFBTagDeepJet_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets116MaxDeta1p6_DoublePFBTagDeepCSV_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets116MaxDeta1p6_DoublePFBTagDeepJet_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets128MaxDeta1p6_DoublePFBTagDeepCSV_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets128MaxDeta1p6_DoublePFBTagDeepJet_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets200_PFBTagDeepCSV_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets200_PFBTagDeepJet_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets350_PFBTagDeepCSV_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets350_PFBTagDeepJet_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets40_Mass500_MediumDeepTauPFTauHPS45_L2NN_MediumDeepTauPFTauHPS20_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets40_PFBTagDeepCSV_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePFJets40_PFBTagDeepJet_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePhoton33_CaloIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoublePhoton70** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePhoton85** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleTightChargedIsoPFTauHPS35_Trk1_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleTrkMu_16_6_NoFiltersNoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_ECALHT800** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_EcalCalibration** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele115_CaloIdVT_GsfTrkIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele12_CaloIdL_TrackIdL_IsoVL_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele135_CaloIdVT_GsfTrkIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele145_CaloIdVT_GsfTrkIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele15_CaloIdL_TrackIdL_IsoVL_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele15_Ele8_CaloIdL_TrackIdL_IsoVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele15_IsoVVVL_PFHT450** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele15_IsoVVVL_PFHT450_CaloBTagDeepCSV_4p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele15_IsoVVVL_PFHT450_PFMET50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele15_IsoVVVL_PFHT600** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele15_WPLoose_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele16_Ele12_Ele8_CaloIdL_TrackIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele17_CaloIdM_TrackIdM_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele17_WPLoose_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele200_CaloIdVT_GsfTrkIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele20_WPLoose_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele20_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele20_eta2p1_WPLoose_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele23_CaloIdL_TrackIdL_IsoVL_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele23_CaloIdM_TrackIdM_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele23_Ele12_CaloIdL_TrackIdL_IsoVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele23_Ele12_CaloIdL_TrackIdL_IsoVL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele24_eta2p1_WPTight_Gsf_LooseDeepTauPFTauHPS30_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.2%|
| **HLT_Ele24_eta2p1_WPTight_Gsf_TightChargedIsoPFTauHPS30_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.2%|
| **HLT_Ele250_CaloIdVT_GsfTrkIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele27_Ele37_CaloIdL_MW** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele27_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele28_HighEta_SC20_Mass55** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele28_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele28_eta2p1_WPTight_Gsf_HT150** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele300_CaloIdVT_GsfTrkIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele30_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele30_eta2p1_WPTight_Gsf_CentralPFJet35_EleCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele32_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele32_WPTight_Gsf_L1DoubleEG** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele35_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele35_WPTight_Gsf_L1EGMT** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele38_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.2%|
| **HLT_Ele40_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.2%|
| **HLT_Ele50_CaloIdVT_GsfTrkIdT_PFJet165** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele50_IsoVVVL_PFHT450** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele8_CaloIdL_TrackIdL_IsoVL_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Ele8_CaloIdM_TrackIdM_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_EphemeralPhysics** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_EphemeralZeroBias** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_ExpressMuons** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_HT170_L1SingleLLPJet_DisplacedDijet40_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DelayedJet40_DoubleDelay0p5nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DelayedJet40_DoubleDelay1nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DelayedJet40_SingleDelay1nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DelayedJet40_SingleDelay2nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DisplacedDijet30_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DisplacedDijet35_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DisplacedDijet40_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DisplacedDijet40_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DisplacedDijet60_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT270_L1SingleLLPJet_DisplacedDijet40_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT300_Beamspot** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT320_L1SingleLLPJet_DisplacedDijet60_Inclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT400_DisplacedDijet40_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT420_L1SingleLLPJet_DisplacedDijet60_Inclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT425** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT430_DelayedJet40_DoubleDelay0p5nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT430_DelayedJet40_DoubleDelay1nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay1nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay2nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT430_DisplacedDijet30_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT430_DisplacedDijet35_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT430_DisplacedDijet40_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT430_DisplacedDijet40_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT430_DisplacedDijet60_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT450_Beamspot** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT500_DisplacedDijet40_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT550_DisplacedDijet60_Inclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT650_DisplacedDijet60_Inclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HcalCalibration** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HcalIsolatedbunch** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HcalNZS** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HcalPhiSym** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_HighPtTkMu100** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu20** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_IsoMu20_eta2p1_LooseDeepTauPFTauHPS27_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu20_eta2p1_TightChargedIsoPFTauHPS27_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu20_eta2p1_TightChargedIsoPFTauHPS27_eta2p1_TightID_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu24** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_IsoMu24_TwoProngs35** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_IsoMu24_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_IsoMu24_eta2p1_LooseDeepTauPFTauHPS180_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu24_eta2p1_LooseDeepTauPFTauHPS30_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS20_eta2p1_SingleL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS30_L2NN_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS30_L2NN_eta2p1_PFJet60_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS30_L2NN_eta2p1_PFJet75_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS35_L2NN_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS45_L2NN_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu27** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_IsoMu27_LooseChargedIsoPFTau20_Trk1_eta2p1_SingleL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu27_LooseChargedIsoPFTauHPS20_Trk1_eta2p1_SingleL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu27_MET90** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu27_MediumChargedIsoPFTauHPS20_Trk1_eta2p1_SingleL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu27_TightChargedIsoPFTauHPS20_Trk1_eta2p1_SingleL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoMu30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_IsoTrackHB** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_IsoTrackHE** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L1CSCShower_DTCluster50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L1CSCShower_DTCluster75** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L1ETMHadSeeds** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L1MET_DTCluster50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L1MET_DTClusterNoMB1S50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L1Mu6HT240** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L1NotBptxOR** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L1SingleMu18** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_L1SingleMu25** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_L1SingleMuCosmics** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_L1UnpairedBunchBptxMinus** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L1UnpairedBunchBptxPlus** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L1_CDC_SingleMu_3_er1p2_TOP120_DPHI2p618_3p142** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L2Mu10** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_L2Mu10NoVtx_2Cha** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_L2Mu10NoVtx_2Cha_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L2Mu10_NoVertex_NoBPTX** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L2Mu10_NoVertex_NoBPTX3BX** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L2Mu23NoVtx_2Cha** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_L2Mu23NoVtx_2Cha_CosmicSeed** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_L2Mu40_NoVertex_3Sta_NoBPTX3BX** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L2Mu45_NoVertex_3Sta_NoBPTX3BX** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_L2Mu50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_L3Mu10NoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_L3Mu10NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_L3dTksMu10_NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_LooseDeepTauPFTauHPS180_L2NN_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_MET105_IsoTrk50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_MET120_IsoTrk50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_MediumChargedIsoPFTau180HighPtRelaxedIso_Trk50_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_MediumChargedIsoPFTau200HighPtRelaxedIso_Trk50_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_MediumChargedIsoPFTau220HighPtRelaxedIso_Trk50_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_MonoCentralPFJet80_PFMETNoMu110_PFMHTNoMu110_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_MonoCentralPFJet80_PFMETNoMu120_PFMHTNoMu120_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_MonoCentralPFJet80_PFMETNoMu130_PFMHTNoMu130_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_MonoCentralPFJet80_PFMETNoMu140_PFMHTNoMu140_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu0_L1DoubleMu** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu10_TrkIsoVVL_DiPFJet40_DEta3p5_MJJ750_HTT350_PFMETNoMu60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu12_DoublePFJets100_PFBTagDeepCSV_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_DoublePFJets100_PFBTagDeepJet_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_DoublePFJets200_PFBTagDeepCSV_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_DoublePFJets200_PFBTagDeepJet_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_DoublePFJets350_PFBTagDeepCSV_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_DoublePFJets350_PFBTagDeepJet_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_DoublePFJets40MaxDeta1p6_DoublePFBTagDeepCSV_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_DoublePFJets40MaxDeta1p6_DoublePFBTagDeepJet_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_DoublePFJets40_PFBTagDeepCSV_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_DoublePFJets40_PFBTagDeepJet_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_DoublePFJets54MaxDeta1p6_DoublePFBTagDeepCSV_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_DoublePFJets54MaxDeta1p6_DoublePFBTagDeepJet_p71** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_DoublePhoton20** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_IP6_part0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_IP6_part1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_IP6_part2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_IP6_part3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_IP6_part4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu12eta2p3** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu12eta2p3_PFJet40** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu15** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu15_IsoVVVL_PFHT450** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu15_IsoVVVL_PFHT450_CaloBTagDeepCSV_4p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu15_IsoVVVL_PFHT450_PFMET50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu15_IsoVVVL_PFHT600** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu17** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu17_Photon30_IsoCaloId** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu17_TrkIsoVVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu17_TrkIsoVVL_Mu8_TrkIsoVVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu17_TrkIsoVVL_Mu8_TrkIsoVVL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu17_TrkIsoVVL_Mu8_TrkIsoVVL_DZ_Mass3p8** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu17_TrkIsoVVL_Mu8_TrkIsoVVL_DZ_Mass8** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu18_Mu9** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu18_Mu9_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu18_Mu9_SameSign** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu18_Mu9_SameSign_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu19** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu19_TrkIsoVVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu19_TrkIsoVVL_Mu9_TrkIsoVVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu19_TrkIsoVVL_Mu9_TrkIsoVVL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu19_TrkIsoVVL_Mu9_TrkIsoVVL_DZ_Mass3p8** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu19_TrkIsoVVL_Mu9_TrkIsoVVL_DZ_Mass8** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu20** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu20NoFiltersNoVtxDisplaced_Photon20_CaloCustomId** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu20_Mu10** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu20_Mu10_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu20_Mu10_SameSign** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu20_Mu10_SameSign_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu20_TkMu0_Phi** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu23_Mu12** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu23_Mu12_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu23_Mu12_SameSign** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu23_Mu12_SameSign_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu23_TrkIsoVVL_Ele12_CaloIdL_TrackIdL_IsoVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu23_TrkIsoVVL_Ele12_CaloIdL_TrackIdL_IsoVL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu25_TkMu0_Onia** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu25_TkMu0_Phi** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu27** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu27_Ele37_CaloIdL_MW** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu30_TkMu0_Psi** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu30_TkMu0_Upsilon** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu37_Ele27_CaloIdL_MW** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu37_TkMu27** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu38NoFiltersNoVtxDisplaced_Photon38_CaloIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu3_L1SingleMu5orSingleMu7** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu3_PFJet40** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMET100_PFMHT100_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMET70_PFMHT70_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMET80_PFMHT80_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMET90_PFMHT90_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMETNoMu100_PFMHTNoMu100_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMETNoMu70_PFMHTNoMu70_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMETNoMu80_PFMHTNoMu80_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMETNoMu90_PFMHTNoMu90_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu43NoFiltersNoVtxDisplaced_Photon43_CaloIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu43NoFiltersNoVtx_Photon43_CaloIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu48NoFiltersNoVtx_Photon48_CaloIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu4_L1DoubleMu** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu4_TrkIsoVVL_DiPFJet90_40_DEta3p5_MJJ750_HTT300_PFMETNoMu60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu50_IsoVVVL_PFHT450** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu55** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet30_Inclusive0PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet30_Inclusive1PtrkShortSig5_DisplacedLoose** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet35_Inclusive0PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet35_Inclusive1PtrkShortSig5_DisplacedLoose** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet40_Inclusive0PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet40_Inclusive1PtrkShortSig5_DisplacedLoose** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu7_IP4_part0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu7_IP4_part1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu7_IP4_part2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu7_IP4_part3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu7_IP4_part4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu7p5_L2Mu2_Jpsi** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu7p5_L2Mu2_Upsilon** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu8_DiEle12_CaloIdL_TrackIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_DiEle12_CaloIdL_TrackIdL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_Ele8_CaloIdM_TrackIdM_Mass8_PFHT350** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_Ele8_CaloIdM_TrackIdM_Mass8_PFHT350_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_IP3_part0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu8_IP3_part1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu8_IP3_part2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu8_IP3_part3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu8_IP3_part4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu8_IP5_part0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_IP5_part1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_IP5_part2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_IP5_part3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_IP5_part4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_IP6_part0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_IP6_part1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_IP6_part2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_IP6_part3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_IP6_part4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_TrkIsoVVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu8_TrkIsoVVL_DiPFJet40_DEta3p5_MJJ750_HTT300_PFMETNoMu60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_CaloDiJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_CaloDiJet30_CaloBtagDeepCSV_1p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFDiJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFDiJet30_PFBtagDeepCSV_1p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFDiJet30_PFBtagDeepJet_1p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP0_part0** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Mu9_IP3_part0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu9_IP4_part0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP4_part1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP4_part2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP4_part3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP4_part4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP5_part0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP5_part1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP5_part2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP5_part3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP5_part4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP6_part0** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP6_part1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP6_part2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP6_part3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu9_IP6_part4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_OnlineMonitorGroup** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT1050** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT180** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_PFHT250** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT330PT30_QuadPFJet_75_60_45_40** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT330PT30_QuadPFJet_75_60_45_40_TriplePFBTagDeepCSV_4p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT330PT30_QuadPFJet_75_60_45_40_TriplePFBTagDeepJet_4p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT350** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT350MinPFJet15** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT370** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT400_FivePFJet_100_100_60_30_30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT400_FivePFJet_100_100_60_30_30_DoublePFBTagDeepCSV_4p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT400_FivePFJet_100_100_60_30_30_DoublePFBTagDeepJet_4p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT400_FivePFJet_120_120_60_30_30_DoublePFBTagDeepCSV_4p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT400_FivePFJet_120_120_60_30_30_DoublePFBTagDeepJet_4p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT400_SixPFJet32** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT400_SixPFJet32_DoublePFBTagDeepCSV_2p94** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT400_SixPFJet32_DoublePFBTagDeepJet_2p94** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT430** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT450_SixPFJet36** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT450_SixPFJet36_PFBTagDeepCSV_1p59** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT450_SixPFJet36_PFBTagDeepJet_1p59** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT500_PFMET100_PFMHT100_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT500_PFMET110_PFMHT110_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT510** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT590** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT680** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT700_PFMET85_PFMHT85_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT700_PFMET95_PFMHT95_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT780** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT800_PFMET75_PFMHT75_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT800_PFMET85_PFMHT85_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT890** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJet140** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJet15** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJet200** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJet25** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_PFJet260** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJet320** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJet40** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_PFJet400** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJet450** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJet500** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJet550** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJet60** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_PFJet80** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_PFJetFwd140** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJetFwd15** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.2%|
| **HLT_PFJetFwd200** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJetFwd25** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_PFJetFwd260** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJetFwd320** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJetFwd40** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_PFJetFwd400** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJetFwd450** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJetFwd500** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJetFwd60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFJetFwd80** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET100_PFMHT100_IDTight_CaloBTagDeepCSV_3p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET100_PFMHT100_IDTight_PFHT60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET105_IsoTrk50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET105_PFJet100_looseRecoiling** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET110_PFJet100** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET110_PFJet100_looseRecoiling** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET110_PFMHT110_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET110_PFMHT110_IDTight_CaloBTagDeepCSV_3p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET120_PFMHT120_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET120_PFMHT120_IDTight_CaloBTagDeepCSV_3p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET120_PFMHT120_IDTight_PFHT60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET130_PFMHT130_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET130_PFMHT130_IDTight_CaloBTagDeepCSV_3p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET140_PFMHT140_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET140_PFMHT140_IDTight_CaloBTagDeepCSV_3p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET200_BeamHaloCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET200_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET250_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMET300_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETNoMu100_PFMHTNoMu100_IDTight_PFHT60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETNoMu110_PFMHTNoMu110_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETNoMu110_PFMHTNoMu110_IDTight_FilterHF** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETNoMu120_PFMHTNoMu120_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETNoMu120_PFMHTNoMu120_IDTight_FilterHF** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETNoMu120_PFMHTNoMu120_IDTight_PFHT60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETNoMu130_PFMHTNoMu130_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETNoMu130_PFMHTNoMu130_IDTight_FilterHF** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETNoMu140_PFMHTNoMu140_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETNoMu140_PFMHTNoMu140_IDTight_FilterHF** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETTypeOne100_PFMHT100_IDTight_PFHT60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETTypeOne110_PFMHT110_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETTypeOne120_PFMHT120_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETTypeOne120_PFMHT120_IDTight_PFHT60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETTypeOne130_PFMHT130_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETTypeOne140_PFMHT140_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETTypeOne200_BeamHaloCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PPSMaxTracksPerArm1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PPSMaxTracksPerRP4** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon100EBHE10** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon100EB_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon100EEHE10** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon100EE_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon110EB_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon120** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon120EB_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon120_R9Id90_HE10_IsoM** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon150** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon165_R9Id90_HE10_IsoM** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon175** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon20** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Photon200** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon20_HoverELoose** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Photon300_NoHE** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon30EB_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Photon30_HoverELoose** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Photon33** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Photon35_TwoProngs35** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon50_R9Id90_HE10_IsoM** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon50_R9Id90_HE10_IsoM_EBOnly_PFJetsMJJ300DEta3_PFMET50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon60_R9Id90_CaloIdL_IsoL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon60_R9Id90_CaloIdL_IsoL_DisplacedIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon60_R9Id90_CaloIdL_IsoL_DisplacedIdL_PFHT350MinPFJet15** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon75** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon75_R9Id90_HE10_IsoM** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon75_R9Id90_HE10_IsoM_EBOnly_CaloMJJ300_PFJetsMJJ400DEta3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon75_R9Id90_HE10_IsoM_EBOnly_CaloMJJ400_PFJetsMJJ600DEta3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon75_R9Id90_HE10_IsoM_EBOnly_PFJetsMJJ300DEta3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon75_R9Id90_HE10_IsoM_EBOnly_PFJetsMJJ600DEta3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon90** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon90_CaloIdL_PFHT700** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon90_R9Id90_HE10_IsoM** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Physics** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet103_88_75_15** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet103_88_75_15_DoublePFBTagDeepCSV_1p3_7p7_VBF1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet103_88_75_15_DoublePFBTagDeepJet_1p3_7p7_VBF1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet103_88_75_15_PFBTagDeepCSV_1p3_VBF2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet103_88_75_15_PFBTagDeepJet_1p3_VBF2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet105_88_76_15** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet105_88_76_15_DoublePFBTagDeepCSV_1p3_7p7_VBF1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet105_88_76_15_DoublePFBTagDeepJet_1p3_7p7_VBF1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet105_88_76_15_PFBTagDeepCSV_1p3_VBF2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet105_88_76_15_PFBTagDeepJet_1p3_VBF2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet111_90_80_15** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet111_90_80_15_DoublePFBTagDeepCSV_1p3_7p7_VBF1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet111_90_80_15_DoublePFBTagDeepJet_1p3_7p7_VBF1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet111_90_80_15_PFBTagDeepCSV_1p3_VBF2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet111_90_80_15_PFBTagDeepJet_1p3_VBF2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet70_50_40_30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet70_50_40_30_PFBTagParticleNet_2BTagSum0p65** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet70_50_40_35_PFBTagParticleNet_2BTagSum0p65** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet70_50_45_35_PFBTagParticleNet_2BTagSum0p65** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet98_83_71_15** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet98_83_71_15_DoublePFBTagDeepCSV_1p3_7p7_VBF1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet98_83_71_15_DoublePFBTagDeepJet_1p3_7p7_VBF1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet98_83_71_15_PFBTagDeepCSV_1p3_VBF2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_QuadPFJet98_83_71_15_PFBTagDeepJet_1p3_VBF2** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Random** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Rsq0p35** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Rsq0p40** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_RsqMR300_Rsq0p09_MR200** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_RsqMR300_Rsq0p09_MR200_4jet** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_RsqMR320_Rsq0p09_MR200** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_RsqMR320_Rsq0p09_MR200_4jet** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_SingleJet30_Mu12_SinglePFJet40** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_SinglePhoton10_Eta3p1ForPPRef** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.4%|
| **HLT_SinglePhoton20_Eta3p1ForPPRef** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_SinglePhoton30_Eta3p1ForPPRef** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_Tau3Mu_Mu7_Mu1_TkMu1_IsoTau15** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Tau3Mu_Mu7_Mu1_TkMu1_IsoTau15_Charge1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Tau3Mu_Mu7_Mu1_TkMu1_Tau15** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Tau3Mu_Mu7_Mu1_TkMu1_Tau15_Charge1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Trimuon5_3p5_2_Upsilon_Muon** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_TrimuonOpen_5_3p5_2_Upsilon_Muon** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_TripleJet110_35_35_Mjj650_PFMET110** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_TripleJet110_35_35_Mjj650_PFMET120** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_TripleJet110_35_35_Mjj650_PFMET130** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_TripleMu_10_5_5_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_TripleMu_12_10_5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_TripleMu_5_3_3_Mass3p8_DCA** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_TripleMu_5_3_3_Mass3p8_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_TrkMu12_DoubleTrkMu5NoFiltersNoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_TrkMu16NoFiltersNoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_TrkMu16_DoubleTrkMu6NoFiltersNoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_TrkMu17_DoubleTrkMu8NoFiltersNoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_TrkMu6NoFiltersNoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.3%|
| **HLT_UncorrectedJetE30_NoBPTX** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_UncorrectedJetE30_NoBPTX3BX** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_UncorrectedJetE60_NoBPTX3BX** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_UncorrectedJetE70_NoBPTX3BX** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_VBF_DoubleLooseChargedIsoPFTauHPS20_Trk1_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_VBF_DoubleMediumChargedIsoPFTauHPS20_Trk1_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_VBF_DoubleMediumDeepTauPFTauHPS20_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_VBF_DoubleTightChargedIsoPFTauHPS20_Trk1_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_ZeroBias** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_ZeroBias_Alignment** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_ZeroBias_Beamspot** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_ZeroBias_FirstBXAfterTrain** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_ZeroBias_FirstCollisionAfterAbortGap** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_ZeroBias_FirstCollisionInTrain** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_ZeroBias_IsolatedBunches** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_ZeroBias_LastCollisionInTrain** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|

### HLTriggerFinalPath
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **HLTriggerFinalPath** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 100.0%|

### HLTriggerFirstPath
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **HLTriggerFirstPath** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 100.0%|

### HTXS
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **HTXS_Higgs_pt** | Float_t| pt of the Higgs boson as identified in HTXS | 0.1| 0.1| 6.4%|
| **HTXS_Higgs_y** | Float_t| rapidity of the Higgs boson as identified in HTXS | 0.1| 0.1| 6.5%|
| **HTXS_njets25** | UChar_t| number of jets with pt>25 GeV as identified in HTXS | 0.1| 0.1| 5.6%|
| **HTXS_njets30** | UChar_t| number of jets with pt>30 GeV as identified in HTXS | 0.1| 0.1| 5.6%|
| **HTXS_stage1_1_cat_pTjet25GeV** | Int_t| HTXS stage-1.1 category(jet pt>25 GeV) | 0.1| 0.1| 6.9%|
| **HTXS_stage1_1_cat_pTjet30GeV** | Int_t| HTXS stage-1.1 category(jet pt>30 GeV) | 0.1| 0.1| 6.9%|
| **HTXS_stage1_1_fine_cat_pTjet25GeV** | Int_t| HTXS stage-1.1-fine category(jet pt>25 GeV) | 0.1| 0.1| 7.1%|
| **HTXS_stage1_1_fine_cat_pTjet30GeV** | Int_t| HTXS stage-1.1-fine category(jet pt>30 GeV) | 0.1| 0.1| 7.1%|
| **HTXS_stage1_2_cat_pTjet25GeV** | Int_t| HTXS stage-1.2 category(jet pt>25 GeV) | 0.1| 0.1| 6.9%|
| **HTXS_stage1_2_cat_pTjet30GeV** | Int_t| HTXS stage-1.2 category(jet pt>30 GeV) | 0.1| 0.1| 6.9%|
| **HTXS_stage1_2_fine_cat_pTjet25GeV** | Int_t| HTXS stage-1.2-fine category(jet pt>25 GeV) | 0.1| 0.1| 7.1%|
| **HTXS_stage1_2_fine_cat_pTjet30GeV** | Int_t| HTXS stage-1.2-fine category(jet pt>30 GeV) | 0.1| 0.1| 7.1%|
| **HTXS_stage_0** | Int_t| HTXS stage-0 category | 0.1| 0.1| 6.4%|
| **HTXS_stage_1_pTjet25** | Int_t| HTXS stage-1 category (jet pt>25 GeV) | 0.1| 0.1| 6.7%|
| **HTXS_stage_1_pTjet30** | Int_t| HTXS stage-1 category (jet pt>30 GeV) | 0.1| 0.1| 6.7%|

### IsoTrack
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **IsoTrack_charge** | Short_t| electric charge | 0.4| 1.6| 3.9%|
| **IsoTrack_dxy** | Float_t| dxy (with sign) wrt first PV, in cm | 1.0| 3.9| 9.5%|
| **IsoTrack_dz** | Float_t| dz (with sign) wrt first PV, in cm | 1.0| 3.9| 9.5%|
| **IsoTrack_eta** | Float_t| eta | 1.0| 3.9| 9.6%|
| **IsoTrack_fromPV** | Short_t| isolated track comes from PV | 0.4| 1.7| 4.2%|
| **IsoTrack_isFromLostTrack** | Bool_t| if isolated track comes from a lost track | 0.4| 1.5| 3.7%|
| **IsoTrack_isHighPurityTrack** | Bool_t| track is high purity | 0.4| 1.5| 3.8%|
| **IsoTrack_isPFcand** | Bool_t| if isolated track is a PF candidate | 0.3| 1.3| 3.3%|
| **IsoTrack_miniPFRelIso_all** | Float_t| mini PF relative isolation, total (with scaled rho*EA PU corrections) | 0.8| 3.1| 7.6%|
| **IsoTrack_miniPFRelIso_chg** | Float_t| mini PF relative isolation, charged component | 0.6| 2.3| 5.7%|
| **IsoTrack_pdgId** | Int_t| PDG id of PF cand | 0.4| 1.7| 4.2%|
| **IsoTrack_pfRelIso03_all** | Float_t| PF relative isolation dR=0.3, total (deltaBeta corrections) | 0.8| 3.3| 8.0%|
| **IsoTrack_pfRelIso03_chg** | Float_t| PF relative isolation dR=0.3, charged component | 0.7| 2.8| 6.9%|
| **IsoTrack_phi** | Float_t| phi | 1.0| 3.9| 9.6%|
| **IsoTrack_pt** | Float_t| pt | 0.8| 3.3| 8.1%|
| **nIsoTrack** | Int_t| isolated tracks after basic selection (((pt>5 && (abs(pdgId) == 11 \|\| abs(pdgId) == 13)) \|\| pt > 10) && (abs(pdgId) < 15 \|\| abs(eta) < 2.5) && ((abs(dxy) < 0.2 && abs(dz) < 0.1) \|\| pt>15) && ((pfIsolationDR03().chargedHadronIso < 5 && pt < 25) \|\| pfIsolationDR03().chargedHadronIso/pt < 0.2)) and lepton veto | 0.2| 1.0| 2.4%|

### Jet
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Jet_PNetRegPtRawCorr** | Float_t| ParticleNet universal flavor-aware visible pT regression (no neutrinos), correction relative to raw jet pT | 4.3| 1.5| 2.8%|
| **Jet_PNetRegPtRawCorrNeutrino** | Float_t| ParticleNet universal flavor-aware pT regression neutrino correction, relative to visible. To apply full regression, multiply raw jet pT by both PNetRegPtRawCorr and PNetRegPtRawCorrNeutrino. | 3.4| 1.2| 2.2%|
| **Jet_PNetRegPtRawRes** | Float_t| ParticleNet universal flavor-aware jet pT resolution estimator, (q84 - q16)/2 | 5.4| 1.8| 3.5%|
| **Jet_area** | Float_t| jet catchment area, for JECs | 2.8| 1.0| 1.8%|
| **Jet_btagDeepFlavB** | Float_t| DeepJet b+bb+lepb tag discriminator | 6.4| 2.2| 4.1%|
| **Jet_btagDeepFlavCvB** | Float_t| DeepJet c vs b+bb+lepb discriminator | 5.2| 1.8| 3.4%|
| **Jet_btagDeepFlavCvL** | Float_t| DeepJet c vs uds+g discriminator | 6.0| 2.1| 3.9%|
| **Jet_btagDeepFlavQG** | Float_t| DeepJet g vs uds discriminator | 5.4| 1.9| 3.5%|
| **Jet_btagPNetB** | Float_t| ParticleNet b vs. udscg | 4.8| 1.6| 3.1%|
| **Jet_btagPNetCvB** | Float_t| ParticleNet c vs. b | 4.2| 1.5| 2.7%|
| **Jet_btagPNetCvL** | Float_t| ParticleNet c vs. udsg | 4.6| 1.6| 3.0%|
| **Jet_btagPNetQvG** | Float_t| ParticleNet q (udsbc) vs. g | 5.2| 1.8| 3.4%|
| **Jet_btagPNetTauVJet** | Float_t| ParticleNet tau vs. jet | 4.9| 1.7| 3.2%|
| **Jet_btagRobustParTAK4B** | Float_t| RobustParTAK4 b+bb+lepb tag discriminator | 4.8| 1.7| 3.1%|
| **Jet_btagRobustParTAK4CvB** | Float_t| RobustParTAK4 c vs b+bb+lepb discriminator | 4.1| 1.4| 2.7%|
| **Jet_btagRobustParTAK4CvL** | Float_t| RobustParTAK4 c vs uds+g discriminator | 4.7| 1.6| 3.1%|
| **Jet_btagRobustParTAK4QG** | Float_t| RobustParTAK4 g vs uds discriminator | 4.2| 1.4| 2.7%|
| **Jet_chEmEF** | Float_t| charged Electromagnetic Energy Fraction | 1.8| 0.6| 1.2%|
| **Jet_chHEF** | Float_t| charged Hadron Energy Fraction | 4.0| 1.4| 2.6%|
| **Jet_electronIdx1** | Short_t(index to Electron)| index of first matching electron | 1.2| 0.4| 0.8%|
| **Jet_electronIdx2** | Short_t(index to Electron)| index of second matching electron | 0.8| 0.3| 0.5%|
| **Jet_eta** | Float_t| eta | 7.5| 2.6| 4.8%|
| **Jet_genJetIdx** | Short_t(index to Genjet)| index of matched gen jet | 1.7| 0.6| 1.1%|
| **Jet_hadronFlavour** | UChar_t| flavour from hadron ghost clustering | 0.8| 0.3| 0.5%|
| **Jet_hfadjacentEtaStripsSize** | Int_t| eta size of the strips next to the central tower strip in HF (noise discriminating variable) | 1.0| 0.3| 0.6%|
| **Jet_hfcentralEtaStripSize** | Int_t| eta size of the central tower strip in HF (noise discriminating variable) | 1.2| 0.4| 0.8%|
| **Jet_hfsigmaEtaEta** | Float_t| sigmaEtaEta for HF jets (noise discriminating variable) | 1.9| 0.6| 1.2%|
| **Jet_hfsigmaPhiPhi** | Float_t| sigmaPhiPhi for HF jets (noise discriminating variable) | 1.9| 0.6| 1.2%|
| **Jet_jetId** | UChar_t| Jet ID flag: bit2 is tight, bit3 is tightLepVeto | 1.4| 0.5| 0.9%|
| **Jet_mass** | Float_t| mass | 6.0| 2.1| 3.9%|
| **Jet_muEF** | Float_t| muon Energy Fraction | 1.8| 0.6| 1.2%|
| **Jet_muonIdx1** | Short_t(index to Muon)| index of first matching muon | 1.2| 0.4| 0.8%|
| **Jet_muonIdx2** | Short_t(index to Muon)| index of second matching muon | 0.8| 0.3| 0.5%|
| **Jet_muonSubtrFactor** | Float_t| 1-(muon-subtracted raw pt)/(raw pt) | 4.9| 1.7| 3.2%|
| **Jet_nConstituents** | UChar_t| Number of particles in the jet | 2.1| 0.7| 1.4%|
| **Jet_nElectrons** | UChar_t| number of electrons in the jet | 1.0| 0.4| 0.7%|
| **Jet_nMuons** | UChar_t| number of muons in the jet | 1.0| 0.4| 0.7%|
| **Jet_nSVs** | UChar_t| number of secondary vertices in the jet | 1.0| 0.3| 0.6%|
| **Jet_neEmEF** | Float_t| neutral Electromagnetic Energy Fraction | 3.2| 1.1| 2.1%|
| **Jet_neHEF** | Float_t| neutral Hadron Energy Fraction | 3.7| 1.3| 2.4%|
| **Jet_partonFlavour** | Short_t| flavour from parton matching | 1.8| 0.6| 1.2%|
| **Jet_phi** | Float_t| phi | 7.4| 2.6| 4.8%|
| **Jet_pt** | Float_t| pt | 5.7| 2.0| 3.7%|
| **Jet_rawFactor** | Float_t| 1 - Factor to get back to raw pT | 4.0| 1.4| 2.6%|
| **Jet_svIdx1** | Short_t(index to Sv)| index of first matching secondary vertex | 1.2| 0.4| 0.7%|
| **Jet_svIdx2** | Short_t(index to Sv)| index of second matching secondary vertex | 0.9| 0.3| 0.6%|
| **nJet** | Int_t| slimmedJetsPuppi, i.e. ak4 PFJets Puppi with JECs applied, after basic selection (pt > 15) | 0.5| 0.2| 0.3%|

### L1
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **L1_AlwaysTrue** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BPTX_AND_Ref1_VME** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BPTX_AND_Ref3_VME** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BPTX_AND_Ref4_VME** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BPTX_BeamGas_B1_VME** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BPTX_BeamGas_B2_VME** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BPTX_BeamGas_Ref1_VME** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BPTX_BeamGas_Ref2_VME** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BPTX_NotOR_VME** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BPTX_OR_Ref3_VME** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BPTX_OR_Ref4_VME** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BPTX_RefAND_VME** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BptxMinus** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BptxOR** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BptxPlus** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_BptxXOR** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_CDC_SingleMu_3_er1p2_TOP120_DPHI2p618_3p142** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleEG10_er1p2_dR_Max0p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleEG10p5_er1p2_dR_Max0p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleEG11_er1p2_dR_Max0p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleEG4_er1p2_dR_Max0p9** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG4p5_er1p2_dR_Max0p9** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG5_er1p2_dR_Max0p9** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG5p5_er1p2_dR_Max0p8** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG6_er1p2_dR_Max0p8** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG6p5_er1p2_dR_Max0p8** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG7_er1p2_dR_Max0p8** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG7p5_er1p2_dR_Max0p7** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG8_er1p2_dR_Max0p7** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG8er2p5_HTT260er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG8er2p5_HTT280er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG8er2p5_HTT300er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG8er2p5_HTT320er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG8er2p5_HTT340er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG8p5_er1p2_dR_Max0p7** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG9_er1p2_dR_Max0p7** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleEG9p5_er1p2_dR_Max0p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleEG_15_10_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_20_10_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_22_10_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_25_12_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_25_14_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_27_14_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_LooseIso16_LooseIso12_er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleEG_LooseIso18_LooseIso12_er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleEG_LooseIso20_10_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_LooseIso20_LooseIso12_er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleEG_LooseIso22_10_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_LooseIso22_12_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_LooseIso22_LooseIso12_er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleEG_LooseIso25_12_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_LooseIso25_LooseIso12_er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleIsoTau26er2p1_Jet55_RmOvlp_dR0p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleIsoTau26er2p1_Jet70_RmOvlp_dR0p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleIsoTau28er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleIsoTau28er2p1_Mass_Max80** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleIsoTau28er2p1_Mass_Max90** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleIsoTau30er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleIsoTau30er2p1_Mass_Max80** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleIsoTau30er2p1_Mass_Max90** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleIsoTau32er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleIsoTau34er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleIsoTau35er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleIsoTau36er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleJet100er2p3_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet100er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet112er2p3_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet120er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet150er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleJet30er2p5_Mass_Min150_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleJet30er2p5_Mass_Min200_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet30er2p5_Mass_Min250_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet30er2p5_Mass_Min300_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet30er2p5_Mass_Min330_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet30er2p5_Mass_Min360_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet35_Mass_Min450_IsoTau45_RmOvlp** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet35_Mass_Min450_IsoTau45er2p1_RmOvlp_dR0p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet40er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleJet_100_30_DoubleJet30_Mass_Min620** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_110_35_DoubleJet35_Mass_Min620** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_115_40_DoubleJet40_Mass_Min620** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_115_40_DoubleJet40_Mass_Min620_Jet60TT28** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_120_45_DoubleJet45_Mass_Min620** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_120_45_DoubleJet45_Mass_Min620_Jet60TT28** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_80_30_Mass_Min420_DoubleMu0_SQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_80_30_Mass_Min420_IsoTau40_RmOvlp** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_80_30_Mass_Min420_Mu8** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_90_30_DoubleJet30_Mass_Min620** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleLLPJet40** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleLooseIsoEG22er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleLooseIsoEG24er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleMu0** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu0_Mass_Min1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu0_OQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu0_SQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu0_SQ_OS** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu0_Upt15_Upt7** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleMu0_Upt5_Upt5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu0_Upt6_IP_Min1_Upt4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu0_dR_Max1p6_Jet90er2p5_dR_Max0p8** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu0er1p4_OQ_OS_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleMu0er1p4_SQ_OS_dR_Max1p4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu0er1p5_SQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleMu0er1p5_SQ_OS** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleMu0er1p5_SQ_OS_dR_Max1p4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu0er1p5_SQ_dR_Max1p4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu0er2p0_SQ_OS_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_DoubleMu0er2p0_SQ_OS_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu0er2p0_SQ_OS_dR_Max1p4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu0er2p0_SQ_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu0er2p0_SQ_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu0er2p0_SQ_dR_Max1p4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu18er2p1_SQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu3_OS_er2p3_Mass_Max14_DoubleEG7p5_er2p1_Mass_Max20** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu3_SQ_ETMHF30_HTT60er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF30_Jet60er2p5_OR_DoubleJet40er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu3_SQ_ETMHF40_HTT60er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF40_Jet60er2p5_OR_DoubleJet40er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu3_SQ_ETMHF50_HTT60er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF50_Jet60er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu3_SQ_ETMHF50_Jet60er2p5_OR_DoubleJet40er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu3_SQ_ETMHF60_Jet60er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu3_SQ_HTT220er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu3_SQ_HTT240er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu3_SQ_HTT260er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu3_dR_Max1p6_Jet90er2p5_dR_Max0p8** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu3er2p0_SQ_OS_dR_Max1p4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu4_SQ_EG9er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu4_SQ_OS** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu4_SQ_OS_dR_Max1p2** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu4p5_SQ_OS** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu4p5_SQ_OS_dR_Max1p2** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu4p5er2p0_SQ_OS** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu4p5er2p0_SQ_OS_Mass_7to18** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu4p5er2p0_SQ_OS_Mass_Min7** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu5_OS_er2p3_Mass_8to14_DoubleEG3er2p1_Mass_Max20** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu5_SQ_EG9er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu8_SQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu9_SQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu_12_5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu_15_5_SQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu_15_7** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu_15_7_Mass_Min1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleMu_15_7_SQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_DoubleTau70er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETM120** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETM150** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETMHF100** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETMHF100_HTT60er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETMHF110** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETMHF110_HTT60er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETMHF110_HTT60er_NotSecondBunchInTrain** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF120** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETMHF120_HTT60er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETMHF120_NotSecondBunchInTrain** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF130** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETMHF130_HTT60er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETMHF140** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETMHF150** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETMHF70** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF70_HTT60er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF80** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF80_HTT60er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF80_SingleJet55er2p5_dPhi_Min2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF80_SingleJet55er2p5_dPhi_Min2p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF90** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETMHF90_HTT60er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF90_SingleJet60er2p5_dPhi_Min2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF90_SingleJet60er2p5_dPhi_Min2p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF90_SingleJet80er2p5_dPhi_Min2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF90_SingleJet80er2p5_dPhi_Min2p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETT1200** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETT1600** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ETT2000** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_FirstBunchAfterTrain** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_FirstBunchBeforeTrain** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_FirstBunchInTrain** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_FirstCollisionInOrbit** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_FirstCollisionInTrain** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_HCAL_LaserMon_Trig** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_HCAL_LaserMon_Veto** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_HTT120_SingleLLPJet40** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_HTT120er** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_HTT160_SingleLLPJet50** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_HTT160er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_HTT200_SingleLLPJet60** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_HTT200er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_HTT240_SingleLLPJet70** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_HTT255er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_HTT280er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_HTT280er_QuadJet_70_55_40_35_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_HTT320er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_HTT320er_QuadJet_70_55_40_40_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_HTT320er_QuadJet_80_60_er2p1_45_40_er2p3** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_HTT320er_QuadJet_80_60_er2p1_50_45_er2p3** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_HTT360er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_HTT400er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_HTT450er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_IsoEG32er2p5_Mt40** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_IsoTau52er2p1_QuadJet36er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_IsolatedBunch** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_LastBunchInTrain** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_LastCollisionInTrain** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_LooseIsoEG22er2p1_IsoTau26er2p1_dR_Min0p3** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG22er2p1_Tau70er2p1_dR_Min0p3** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_LooseIsoEG24er2p1_HTT100er** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG24er2p1_IsoTau27er2p1_dR_Min0p3** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG26er2p1_HTT100er** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG26er2p1_Jet34er2p5_dR_Min0p3** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG28er2p1_HTT100er** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG28er2p1_Jet34er2p5_dR_Min0p3** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG30er2p1_HTT100er** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG30er2p1_Jet34er2p5_dR_Min0p3** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_MinimumBiasHF0** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_MinimumBiasHF0_AND_BptxAND** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_Mu10er2p3_Jet32er2p3_dR_Max0p4_DoubleJet32er2p3_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu12er2p3_Jet40er2p1_dR_Max0p4_DoubleJet40er2p1_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu12er2p3_Jet40er2p3_dR_Max0p4_DoubleJet40er2p3_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu18er2p1_Tau24er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_Mu18er2p1_Tau26er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_Mu18er2p1_Tau26er2p1_Jet55** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu18er2p1_Tau26er2p1_Jet70** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu20_EG10er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu22er2p1_IsoTau28er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu22er2p1_IsoTau30er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu22er2p1_IsoTau32er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu22er2p1_IsoTau34er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu22er2p1_IsoTau36er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu22er2p1_IsoTau40er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu22er2p1_Tau70er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu3_Jet120er2p5_dR_Max0p4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_Mu3_Jet120er2p5_dR_Max0p8** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_Mu3_Jet16er2p5_dR_Max0p4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu3_Jet30er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_Mu3_Jet35er2p5_dR_Max0p4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu3_Jet60er2p5_dR_Max0p4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu3_Jet80er2p5_dR_Max0p4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_Mu3er1p5_Jet100er2p5_ETMHF30** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_Mu3er1p5_Jet100er2p5_ETMHF40** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu3er1p5_Jet100er2p5_ETMHF50** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu5_EG23er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu5_LooseIsoEG20er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu6_DoubleEG10er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu6_DoubleEG12er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_Mu6_DoubleEG15er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_Mu6_DoubleEG17er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_Mu6_HTT240er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_Mu6_HTT250er** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_Mu7_EG20er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu7_EG23er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu7_LooseIsoEG20er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_Mu7_LooseIsoEG23er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_NotBptxOR** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_QuadJet60er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_QuadJet_95_75_65_20_DoubleJet_75_65_er2p5_Jet20_FWD3p0** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_QuadMu0** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_QuadMu0_OQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_QuadMu0_SQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SecondBunchInTrain** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SecondLastBunchInTrain** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleEG10er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleEG15er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleEG26er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleEG28_FWD2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_SingleEG28er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG28er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG28er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG34er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG36er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG38er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG40er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG42er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_SingleEG45er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_SingleEG50** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_SingleEG60** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_SingleEG8er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleIsoEG24er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG24er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG26er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG26er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG26er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG28_FWD2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleIsoEG28er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG28er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG28er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG30er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG30er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG32er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG32er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG34er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoTau32er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleJet10erHE** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleJet120** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_SingleJet120_FWD3p0** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleJet120er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_SingleJet12erHE** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleJet140er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_SingleJet140er2p5_ETMHF70** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleJet140er2p5_ETMHF80** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_SingleJet140er2p5_ETMHF90** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_SingleJet160er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_SingleJet180** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleJet180er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleJet200** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleJet20er2p5_NotBptxOR** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleJet20er2p5_NotBptxOR_3BX** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleJet35** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleJet35_FWD3p0** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_SingleJet35er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleJet43er2p5_NotBptxOR_3BX** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleJet46er2p5_NotBptxOR_3BX** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleJet60** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleJet60_FWD3p0** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_SingleJet60er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleJet8erHE** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleJet90** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_SingleJet90_FWD3p0** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleJet90er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_SingleLooseIsoEG26er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleLooseIsoEG26er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleLooseIsoEG28_FWD2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_SingleLooseIsoEG28er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleLooseIsoEG28er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleLooseIsoEG28er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleLooseIsoEG30er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleLooseIsoEG30er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleMu0_BMTF** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleMu0_DQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu0_EMTF** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu0_OMTF** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_SingleMu10er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu12_DQ_BMTF** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleMu12_DQ_EMTF** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleMu12_DQ_OMTF** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_SingleMu12er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu14er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu15_DQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu16er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleMu18** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu18er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleMu20** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu22** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu22_BMTF** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleMu22_DQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu22_EMTF** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleMu22_OMTF** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.3%|
| **L1_SingleMu22_OQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu25** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu3** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu6er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu7** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu7_DQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu7er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu8er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMu9er1p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMuCosmics** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMuCosmics_BMTF** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleMuCosmics_EMTF** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMuCosmics_OMTF** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.4%|
| **L1_SingleMuOpen** | Bool_t| Trigger/flag bit (process: NANO) | 0.2| 0.2| 0.5%|
| **L1_SingleMuOpen_NotBptxOR** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleMuOpen_er1p1_NotBptxOR_3BX** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleMuOpen_er1p4_NotBptxOR_3BX** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleMuShower_Nominal** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleMuShower_Tight** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleTau120er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_SingleTau130er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_SingleTau70er2p1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TOTEM_1** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_TOTEM_2** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_TOTEM_3** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_TOTEM_4** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_TripleEG16er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_TripleEG_16_12_8_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleEG_16_15_8_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleEG_18_17_8_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleEG_18_18_12_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleJet_100_80_70_DoubleJet_80_70_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleJet_105_85_75_DoubleJet_85_75_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleJet_95_75_65_DoubleJet_75_65_er2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu0** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu0_OQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu0_SQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu3** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu3_SQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu_2SQ_1p5SQ_0OQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu_2SQ_1p5SQ_0OQ_Mass_Max12** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_TripleMu_3SQ_2p5SQ_0OQ_Mass_Max12** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_TripleMu_5SQ_3SQ_0OQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu_5SQ_3SQ_0OQ_DoubleMu_5_3_SQ_OS_Mass_Max9** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu_5SQ_3SQ_0_DoubleMu_5_3_SQ_OS_Mass_Max9** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu_5_3_3** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu_5_3_3_SQ** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu_5_3p5_2p5** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu_5_3p5_2p5_DoubleMu_5_2p5_OS_Mass_5to17** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu_5_3p5_2p5_OQ_DoubleMu_5_2p5_OQ_OS_Mass_5to17** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu_5_4_2p5_DoubleMu_5_2p5_OS_Mass_5to17** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu_5_5_3** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.2%|
| **L1_UnpairedBunchBptxMinus** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_UnpairedBunchBptxPlus** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_UnprefireableEvent** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ZeroBias** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|
| **L1_ZeroBias_copy** | Bool_t| Trigger/flag bit (process: NANO) | 0.1| 0.1| 0.1%|

### L1Reco
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **L1Reco_step** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 100.0%|

### L1simulation
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **L1simulation_step** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 100.0%|

### LHE
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **LHE_AlphaS** | Float_t| Per-event alphaS | 2.6| 2.6| 37.4%|
| **LHE_HT** | Float_t| HT, scalar sum of parton pTs at LHE step | 1.2| 1.2| 16.7%|
| **LHE_HTIncoming** | Float_t| HT, scalar sum of parton pTs at LHE step, restricted to partons | 1.2| 1.2| 16.7%|
| **LHE_Nb** | UChar_t| Number of b partons at LHE step | 0.1| 0.1| 1.1%|
| **LHE_Nc** | UChar_t| Number of c partons at LHE step | 0.1| 0.1| 1.2%|
| **LHE_Nglu** | UChar_t| Number of gluon partons at LHE step | 0.2| 0.2| 2.6%|
| **LHE_Njets** | UChar_t| Number of jets (partons) at LHE step | 0.3| 0.3| 3.6%|
| **LHE_NpLO** | UChar_t| number of partons at LO | 0.1| 0.1| 0.7%|
| **LHE_NpNLO** | UChar_t| number of partons at NLO | 0.1| 0.1| 0.7%|
| **LHE_Nuds** | UChar_t| Number of u,d,s partons at LHE step | 0.2| 0.2| 2.6%|
| **LHE_Vpt** | Float_t| pT of the W or Z boson at LHE step | 1.2| 1.2| 16.6%|

### LHEPart
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **LHEPart_eta** | Float_t| Pseodorapidity of LHE particles | 8.2| 1.5| 19.2%|
| **LHEPart_incomingpz** | Float_t| Pz of incoming LHE particles | 6.8| 1.3| 16.0%|
| **LHEPart_mass** | Float_t| Mass of LHE particles | 7.9| 1.5| 18.5%|
| **LHEPart_pdgId** | Int_t| PDG ID of LHE particles | 2.5| 0.5| 5.8%|
| **LHEPart_phi** | Float_t| Phi of LHE particles | 7.8| 1.5| 18.3%|
| **LHEPart_pt** | Float_t| Pt of LHE particles | 5.9| 1.1| 13.7%|
| **LHEPart_spin** | Int_t| Spin of LHE particles | 1.9| 0.3| 4.3%|
| **LHEPart_status** | Int_t| LHE particle status; -1:incoming, 1:outgoing | 1.4| 0.3| 3.4%|
| **nLHEPart** | Int_t|  | 0.3| 0.1| 0.7%|

### LHEPdfWeight
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **LHEPdfWeight** | Float_t| LHE pdf variation weights (w_var / w_nominal) for LHA IDs 325300 - 325402 | 112.8| 1.1| 99.9%|
| **nLHEPdfWeight** | Int_t|  | 0.1| 0.0| 0.1%|

### LHEReweightingWeight
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **LHEReweightingWeight** | Float_t|  | 0.1| 0.0| 57.0%|
| **nLHEReweightingWeight** | Int_t|  | 0.1| 0.0| 43.0%|

### LHEScaleWeight
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **LHEScaleWeight** | Float_t| LHE scale variation weights (w_var / w_nominal); [0] is MUF="0.5" MUR="0.5"; [1] is MUF="1.0" MUR="0.5"; [2] is MUF="2.0" MUR="0.5"; [3] is MUF="0.5" MUR="1.0"; [4] is MUF="2.0" MUR="1.0"; [5] is MUF="0.5" MUR="2.0"; [6] is MUF="1.0" MUR="2.0"; [7] is MUF="2.0" MUR="2.0" | 5.5| 0.7| 98.9%|
| **nLHEScaleWeight** | Int_t|  | 0.1| 0.0| 1.1%|

### LHEWeight
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **LHEWeight_originalXWGTUP** | Float_t| Nominal event weight in the LHE file | 0.1| 0.1| 100.0%|

### LowPtElectron
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **LowPtElectron_ID** | Float_t| ID, BDT (raw) score | 3.5| 4.3| 6.6%|
| **LowPtElectron_charge** | Int_t| electric charge | 0.7| 0.9| 1.3%|
| **LowPtElectron_convVeto** | Bool_t| pass conversion veto | 0.6| 0.7| 1.1%|
| **LowPtElectron_convVtxRadius** | Float_t| conversion vertex radius (cm) | 0.7| 0.8| 1.3%|
| **LowPtElectron_convWP** | UChar_t| conversion flag bit map: 1=Veto, 2=Loose, 3=Tight | 0.6| 0.7| 1.1%|
| **LowPtElectron_deltaEtaSC** | Float_t| delta eta (SC,ele) with sign | 2.4| 2.9| 4.4%|
| **LowPtElectron_dxy** | Float_t| dxy (with sign) wrt first PV, in cm | 2.4| 2.9| 4.4%|
| **LowPtElectron_dxyErr** | Float_t| dxy uncertainty, in cm | 1.6| 2.0| 3.1%|
| **LowPtElectron_dz** | Float_t| dz (with sign) wrt first PV, in cm | 2.4| 3.0| 4.5%|
| **LowPtElectron_dzErr** | Float_t| dz uncertainty, in cm | 1.6| 2.0| 3.0%|
| **LowPtElectron_eInvMinusPInv** | Float_t| 1/E_SC - 1/p_trk | 2.4| 2.9| 4.4%|
| **LowPtElectron_electronIdx** | Short_t(index to Electron)| index of the overlapping PF electron (-1 if none) | 0.7| 0.9| 1.4%|
| **LowPtElectron_energyErr** | Float_t| energy error of the cluster-track combination | 1.7| 2.1| 3.2%|
| **LowPtElectron_eta** | Float_t| eta | 2.5| 3.1| 4.7%|
| **LowPtElectron_genPartFlav** | UChar_t| Flavour of genParticle (DressedLeptons for electrons) for MC matching to status==1 electrons or photons: 1 = prompt electron (including gamma*->mu mu), 15 = electron from prompt tau, 22 = prompt photon (likely conversion), 5 = electron from b, 4 = electron from c, 3 = electron from light or unknown, 0 = unmatched | 0.7| 0.9| 1.4%|
| **LowPtElectron_genPartIdx** | Short_t(index to Genpart)| Index into genParticle list for MC matching to status==1 electrons or photons | 1.0| 1.2| 1.8%|
| **LowPtElectron_hoe** | Float_t| H over E | 1.7| 2.1| 3.3%|
| **LowPtElectron_lostHits** | UChar_t| number of missing inner hits | 0.7| 0.8| 1.2%|
| **LowPtElectron_mass** | Float_t| mass | 1.6| 2.0| 3.0%|
| **LowPtElectron_miniPFRelIso_all** | Float_t| mini PF relative isolation, total (with scaled rho*EA PU corrections) | 2.2| 2.7| 4.1%|
| **LowPtElectron_miniPFRelIso_chg** | Float_t| mini PF relative isolation, charged component | 1.6| 2.0| 3.0%|
| **LowPtElectron_pdgId** | Int_t| PDG code assigned by the event reconstruction (not by MC truth) | 0.7| 0.9| 1.3%|
| **LowPtElectron_phi** | Float_t| phi | 2.5| 3.1| 4.7%|
| **LowPtElectron_photonIdx** | Short_t(index to Photon)| index of the first associated photon (-1 if none) | 0.5| 0.6| 1.0%|
| **LowPtElectron_pt** | Float_t| pt | 3.5| 4.3| 6.6%|
| **LowPtElectron_ptbiased** | Float_t| ElectronSeed, pT- and dxy- dependent BDT (raw) score | 3.3| 4.0| 6.1%|
| **LowPtElectron_r9** | Float_t| R9 of the SC, calculated with full 5x5 region | 2.2| 2.7| 4.1%|
| **LowPtElectron_scEtOverPt** | Float_t| (SC energy)/pt-1 | 2.0| 2.5| 3.7%|
| **LowPtElectron_sieie** | Float_t| sigma_IetaIeta of the SC, calculated with full 5x5 region | 1.8| 2.2| 3.3%|
| **LowPtElectron_unbiased** | Float_t| ElectronSeed, pT- and dxy- agnostic BDT (raw) score | 3.3| 4.1| 6.2%|
| **nLowPtElectron** | Int_t| slimmedLowPtElectrons after basic selection (pt > 1. && electronID("ID") > -0.25) | 0.4| 0.5| 0.7%|

### MET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **MET_MetUnclustEnUpDeltaX** | Float_t| Delta (METx_mod-METx) Unclustered Energy Up | 2.1| 2.1| 8.7%|
| **MET_MetUnclustEnUpDeltaY** | Float_t| Delta (METy_mod-METy) Unclustered Energy Up | 2.1| 2.1| 8.6%|
| **MET_covXX** | Float_t| xx element of met covariance matrix | 1.4| 1.4| 5.9%|
| **MET_covXY** | Float_t| xy element of met covariance matrix | 1.7| 1.7| 7.1%|
| **MET_covYY** | Float_t| yy element of met covariance matrix | 1.4| 1.4| 5.9%|
| **MET_fiducialGenPhi** | Float_t| phi | 2.0| 2.0| 8.3%|
| **MET_fiducialGenPt** | Float_t| pt | 1.9| 1.9| 8.0%|
| **MET_phi** | Float_t| phi | 2.4| 2.4| 10.0%|
| **MET_pt** | Float_t| pt | 3.6| 3.6| 14.8%|
| **MET_significance** | Float_t| MET significance | 2.0| 2.0| 8.2%|
| **MET_sumEt** | Float_t| scalar sum of Et | 1.7| 1.7| 7.2%|
| **MET_sumPtUnclustered** | Float_t| sumPt used for MET significance | 1.7| 1.7| 7.2%|

### Muon
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Muon_bsConstrainedChi2** | Float_t| chi2 of beamspot constraint | 1.5| 2.3| 2.2%|
| **Muon_bsConstrainedPt** | Float_t| pT with beamspot constraint | 2.8| 4.3| 4.2%|
| **Muon_bsConstrainedPtErr** | Float_t| pT error with beamspot constraint | 1.4| 2.1| 2.1%|
| **Muon_charge** | Int_t| electric charge | 0.6| 1.0| 0.9%|
| **Muon_dxy** | Float_t| dxy (with sign) wrt first PV, in cm | 2.0| 3.0| 3.0%|
| **Muon_dxyErr** | Float_t| dxy uncertainty, in cm | 1.3| 1.9| 1.9%|
| **Muon_dxybs** | Float_t| dxy (with sign) wrt the beam spot, in cm | 1.9| 3.0| 2.9%|
| **Muon_dz** | Float_t| dz (with sign) wrt first PV, in cm | 2.0| 3.1| 3.0%|
| **Muon_dzErr** | Float_t| dz uncertainty, in cm | 1.3| 2.1| 2.0%|
| **Muon_eta** | Float_t| eta | 2.3| 3.5| 3.4%|
| **Muon_fsrPhotonIdx** | Short_t(index to Fsrphoton)| Index of the lowest-dR/ET2 among associated FSR photons | 0.5| 0.8| 0.8%|
| **Muon_genPartFlav** | UChar_t| Flavour of genParticle (DressedLeptons for electrons) for MC matching to status==1 muons: 1 = prompt muon (including gamma*->mu mu), 15 = muon from prompt tau, 5 = muon from b, 4 = muon from c, 3 = muon from light or unknown, 0 = unmatched | 0.6| 0.9| 0.9%|
| **Muon_genPartIdx** | Short_t(index to Genpart)| Index into genParticle list for MC matching to status==1 muons | 0.9| 1.4| 1.3%|
| **Muon_highPtId** | UChar_t| high-pT cut-based ID (1 = tracker high pT, 2 = global high pT, which includes tracker high pT) | 0.6| 0.9| 0.9%|
| **Muon_highPurity** | Bool_t| inner track is high purity | 0.5| 0.8| 0.8%|
| **Muon_inTimeMuon** | Bool_t| inTimeMuon ID | 0.5| 0.8| 0.8%|
| **Muon_ip3d** | Float_t| 3D impact parameter wrt first PV, in cm | 1.9| 2.9| 2.8%|
| **Muon_isGlobal** | Bool_t| muon is global muon | 0.5| 0.8| 0.8%|
| **Muon_isPFcand** | Bool_t| muon is PF candidate | 0.5| 0.8| 0.8%|
| **Muon_isStandalone** | Bool_t| muon is a standalone muon | 0.5| 0.8| 0.8%|
| **Muon_isTracker** | Bool_t| muon is tracker muon | 0.5| 0.8| 0.8%|
| **Muon_jetIdx** | Short_t(index to Jet)| index of the associated jet (-1 if none) | 0.7| 1.1| 1.0%|
| **Muon_jetNDauCharged** | UChar_t| number of charged daughters of the closest jet | 0.7| 1.0| 1.0%|
| **Muon_jetPtRelv2** | Float_t| Relative momentum of the lepton with respect to the closest jet after subtracting the lepton | 1.4| 2.1| 2.1%|
| **Muon_jetRelIso** | Float_t| Relative isolation in matched jet (1/ptRatio-1, pfRelIso04_all if no matched jet) | 1.5| 2.3| 2.3%|
| **Muon_looseId** | Bool_t| muon is loose muon | 0.5| 0.8| 0.8%|
| **Muon_mass** | Float_t| mass | 0.6| 0.9| 0.9%|
| **Muon_mediumId** | Bool_t| cut-based ID, medium WP | 0.6| 0.8| 0.8%|
| **Muon_mediumPromptId** | Bool_t| cut-based ID, medium prompt WP | 0.6| 0.9| 0.9%|
| **Muon_miniIsoId** | UChar_t| MiniIso ID from miniAOD selector (1=MiniIsoLoose, 2=MiniIsoMedium, 3=MiniIsoTight, 4=MiniIsoVeryTight) | 0.6| 1.0| 0.9%|
| **Muon_miniPFRelIso_all** | Float_t| mini PF relative isolation, total (with scaled rho*EA PU corrections) | 1.7| 2.6| 2.5%|
| **Muon_miniPFRelIso_chg** | Float_t| mini PF relative isolation, charged component | 1.2| 1.8| 1.8%|
| **Muon_multiIsoId** | UChar_t| MultiIsoId from miniAOD selector (1=MultiIsoLoose, 2=MultiIsoMedium) | 0.6| 0.9| 0.9%|
| **Muon_mvaLowPt** | Float_t| Low pt muon ID score | 1.7| 2.7| 2.6%|
| **Muon_mvaMuID** | Float_t| MVA-based ID score | 1.0| 1.6| 1.6%|
| **Muon_mvaMuID_WP** | UChar_t| MVA-based ID selector WPs (1=MVAIDwpMedium,2=MVAIDwpTight) | 0.6| 0.9| 0.9%|
| **Muon_mvaTTH** | Float_t| TTH MVA lepton ID score | 1.8| 2.7| 2.6%|
| **Muon_nStations** | UChar_t| number of matched stations with default arbitration (segment & track) | 0.7| 1.1| 1.0%|
| **Muon_nTrackerLayers** | UChar_t| number of layers in the tracker | 0.8| 1.2| 1.1%|
| **Muon_pdgId** | Int_t| PDG code assigned by the event reconstruction (not by MC truth) | 0.6| 1.0| 0.9%|
| **Muon_pfIsoId** | UChar_t| PFIso ID from miniAOD selector (1=PFIsoVeryLoose, 2=PFIsoLoose, 3=PFIsoMedium, 4=PFIsoTight, 5=PFIsoVeryTight, 6=PFIsoVeryVeryTight) | 0.7| 1.0| 1.0%|
| **Muon_pfRelIso03_all** | Float_t| PF relative isolation dR=0.3, total (deltaBeta corrections) | 2.0| 3.1| 3.0%|
| **Muon_pfRelIso03_chg** | Float_t| PF relative isolation dR=0.3, charged component | 1.7| 2.6| 2.5%|
| **Muon_pfRelIso04_all** | Float_t| PF relative isolation dR=0.4, total (deltaBeta corrections) | 2.3| 3.5| 3.4%|
| **Muon_phi** | Float_t| phi | 2.3| 3.5| 3.5%|
| **Muon_pt** | Float_t| pt | 2.8| 4.3| 4.2%|
| **Muon_ptErr** | Float_t| ptError of the muon track | 1.4| 2.1| 2.1%|
| **Muon_puppiIsoId** | UChar_t| PuppiIsoId from miniAOD selector (1=Loose, 2=Medium, 3=Tight) | 0.6| 1.0| 0.9%|
| **Muon_segmentComp** | Float_t| muon segment compatibility | 1.7| 2.6| 2.6%|
| **Muon_sip3d** | Float_t| 3D impact parameter significance wrt first PV | 1.9| 2.9| 2.8%|
| **Muon_softId** | Bool_t| soft cut-based ID | 0.5| 0.8| 0.8%|
| **Muon_softMva** | Float_t| soft MVA ID score | 1.1| 1.6| 1.6%|
| **Muon_softMvaId** | Bool_t| soft MVA ID | 0.6| 0.9| 0.9%|
| **Muon_svIdx** | Short_t(index to Sv)| index of matching secondary vertex | 0.5| 0.8| 0.8%|
| **Muon_tightCharge** | UChar_t| Tight charge criterion using pterr/pt of muonBestTrack (0:fail, 2:pass) | 0.5| 0.8| 0.7%|
| **Muon_tightId** | Bool_t| cut-based ID, tight WP | 0.6| 0.9| 0.9%|
| **Muon_tkIsoId** | UChar_t| TkIso ID (1=TkIsoLoose, 2=TkIsoTight) | 0.6| 0.9| 0.9%|
| **Muon_tkRelIso** | Float_t| Tracker-based relative isolation dR=0.3 for highPt, trkIso/tunePpt | 1.1| 1.7| 1.7%|
| **Muon_triggerIdLoose** | Bool_t| TriggerIdLoose ID | 0.5| 0.8| 0.8%|
| **Muon_tunepRelPt** | Float_t| TuneP relative pt, tunePpt/pt | 0.6| 0.9| 0.9%|
| **nMuon** | Int_t| slimmedMuons after basic selection (pt > 15 \|\| (pt > 3 && (passed("CutBasedIdLoose") \|\| passed("SoftCutBasedId") \|\| passed("SoftMvaId") \|\| passed("CutBasedIdGlobalHighPt") \|\| passed("CutBasedIdTrkHighPt")))) | 0.3| 0.5| 0.5%|

### OtherPV
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **OtherPV_score** | Float_t| scores of other primary vertices, excluding the main PV | 5.1| 1.7| 47.0%|
| **OtherPV_z** | Float_t| Z position of other primary vertices, excluding the main PV | 5.7| 1.9| 52.4%|
| **nOtherPV** | Int_t|  | 0.1| 0.0| 0.5%|

### PSWeight
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **PSWeight** | Float_t| PS weights (w_var / w_nominal);   [0] is ISR=2 FSR=1; [1] is ISR=1 FSR=2[2] is ISR=0.5 FSR=1; [3] is ISR=1 FSR=0.5; | 8.1| 2.0| 99.3%|
| **nPSWeight** | Int_t|  | 0.1| 0.0| 0.7%|

### PV
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **PV_chi2** | Float_t| main primary vertex reduced chi2 | 1.2| 1.2| 10.7%|
| **PV_ndof** | Float_t| main primary vertex number of degree of freedom | 1.5| 1.5| 13.3%|
| **PV_npvs** | UChar_t| total number of reconstructed primary vertices | 0.7| 0.7| 6.4%|
| **PV_npvsGood** | UChar_t| number of good reconstructed primary vertices. selection:!isFake && ndof > 4 && abs(z) <= 24 && position.Rho <= 2 | 0.7| 0.7| 6.3%|
| **PV_score** | Float_t| main primary vertex score, i.e. sum pt2 of clustered objects | 1.6| 1.6| 14.5%|
| **PV_x** | Float_t| main primary vertex position x coordinate | 1.1| 1.1| 9.9%|
| **PV_y** | Float_t| main primary vertex position y coordinate | 1.5| 1.5| 13.3%|
| **PV_z** | Float_t| main primary vertex position z coordinate | 2.9| 2.9| 25.5%|

### Photon
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Photon_cutBased** | UChar_t| cut-based ID bitmap, RunIIIWinter22V1, (0:fail, 1:loose, 2:medium, 3:tight) | 0.7| 1.0| 1.1%|
| **Photon_ecalPFClusterIso** | Float_t| sum pt of ecal clusters, vetoing clusters part of photon | 1.4| 2.0| 2.1%|
| **Photon_electronIdx** | Short_t(index to Electron)| index of the associated electron (-1 if none) | 0.7| 1.0| 1.0%|
| **Photon_electronVeto** | Bool_t| pass electron veto | 0.6| 0.9| 0.9%|
| **Photon_energyErr** | Float_t| energy error of the cluster from regression | 1.5| 2.2| 2.3%|
| **Photon_energyRaw** | Float_t| raw energy of photon supercluster | 1.8| 2.6| 2.8%|
| **Photon_esEffSigmaRR** | Float_t| preshower sigmaRR | 1.5| 2.2| 2.3%|
| **Photon_esEnergyOverRawE** | Float_t| ratio of preshower energy to raw supercluster energy | 1.4| 2.1| 2.2%|
| **Photon_eta** | Float_t| eta | 2.2| 3.2| 3.4%|
| **Photon_etaWidth** | Float_t| Width of the photon supercluster in eta | 1.5| 2.2| 2.4%|
| **Photon_genPartFlav** | UChar_t| Flavour of genParticle (DressedLeptons for electrons) for MC matching to status==1 photons or electrons: 1 = prompt photon, 11 = prompt electron, 0 = unknown or unmatched | 0.6| 0.9| 0.9%|
| **Photon_genPartIdx** | Short_t(index to Genpart)| Index into genParticle list for MC matching to status==1 photons or electrons | 1.0| 1.4| 1.5%|
| **Photon_haloTaggerMVAVal** | Float_t| Value of MVA based BDT based  beam halo tagger in the Ecal endcap (valid for pT > 200 GeV) | 1.0| 1.4| 1.5%|
| **Photon_hasConversionTracks** | Bool_t| Variable specifying if photon has associated conversion tracks (one-legged or two-legged) | 0.6| 0.8| 0.9%|
| **Photon_hcalPFClusterIso** | Float_t| sum pt of hcal clusters, vetoing clusters part of photon | 1.6| 2.3| 2.5%|
| **Photon_hoe** | Float_t| H over E | 1.6| 2.2| 2.4%|
| **Photon_hoe_PUcorr** | Float_t| PU corrected H/E (cone-based with quadraticEA*rho*rho + linearEA*rho Winter22V1 corrections) | 1.1| 1.5| 1.6%|
| **Photon_isScEtaEB** | Bool_t| is supercluster eta within barrel acceptance | 0.6| 0.9| 0.9%|
| **Photon_isScEtaEE** | Bool_t| is supercluster eta within endcap acceptance | 0.6| 0.9| 0.9%|
| **Photon_jetIdx** | Short_t(index to Jet)| index of the associated jet (-1 if none) | 0.7| 1.0| 1.1%|
| **Photon_mvaID** | Float_t| MVA ID score, Winter22V1 | 1.9| 2.7| 2.8%|
| **Photon_mvaID_WP80** | Bool_t| MVA ID WP80, Winter22V1 | 0.6| 0.9| 0.9%|
| **Photon_mvaID_WP90** | Bool_t| MVA ID WP90, Winter22V1 | 0.6| 0.9| 0.9%|
| **Photon_pfChargedIso** | Float_t| PF absolute isolation dR=0.3, charged component with dxy,dz match to PV | 1.3| 1.9| 2.0%|
| **Photon_pfChargedIsoPFPV** | Float_t| PF absolute isolation dR=0.3, charged component (PF PV only) | 1.9| 2.7| 2.9%|
| **Photon_pfChargedIsoWorstVtx** | Float_t| PF absolute isolation dR=0.3, charged component (Vertex with largest isolation) | 3.0| 4.3| 4.6%|
| **Photon_pfPhoIso03** | Float_t| PF absolute isolation dR=0.3, photon component (uncorrected) | 2.1| 3.0| 3.2%|
| **Photon_pfRelIso03_all_quadratic** | Float_t| PF relative isolation dR=0.3, total (with quadraticEA*rho*rho + linearEA*rho Winter22V1 corrections) | 2.1| 3.1| 3.3%|
| **Photon_pfRelIso03_chg_quadratic** | Float_t| PF relative isolation dR=0.3, charged hadron component (with quadraticEA*rho*rho + linearEA*rho Winter22V1 corrections) | 1.6| 2.3| 2.4%|
| **Photon_phi** | Float_t| phi | 2.2| 3.2| 3.4%|
| **Photon_phiWidth** | Float_t| Width of the photon supercluster in phi | 1.6| 2.3| 2.4%|
| **Photon_pixelSeed** | Bool_t| has pixel seed | 0.6| 0.8| 0.9%|
| **Photon_pt** | Float_t| pt | 2.9| 4.2| 4.5%|
| **Photon_r9** | Float_t| R9 of the supercluster, calculated with full 5x5 region | 1.4| 1.9| 2.1%|
| **Photon_s4** | Float_t| e2x2/e5x5 of the supercluster, calculated with full 5x5 region | 1.3| 1.9| 2.0%|
| **Photon_seedGain** | UChar_t| Gain of the seed crystal | 0.5| 0.7| 0.7%|
| **Photon_seediEtaOriX** | Char_t| iEta or iX of seed crystal. iEta is barrel-only, iX is endcap-only. iEta runs from -85 to +85, with no crystal at iEta=0. iX runs from 1 to 100. | 1.1| 1.6| 1.8%|
| **Photon_seediPhiOriY** | Int_t| iPhi or iY of seed crystal. iPhi is barrel-only, iY is endcap-only. iPhi runs from 1 to 360. iY runs from 1 to 100. | 1.4| 2.0| 2.1%|
| **Photon_sieie** | Float_t| sigma_IetaIeta of the supercluster, calculated with full 5x5 region | 1.5| 2.1| 2.2%|
| **Photon_sieip** | Float_t| sigma_IetaIphi of the supercluster, calculated with full 5x5 region | 1.8| 2.6| 2.7%|
| **Photon_sipip** | Float_t| sigmaIphiIphi of the supercluster | 1.5| 2.1| 2.3%|
| **Photon_trkSumPtHollowConeDR03** | Float_t| Sum of track pT in a hollow cone of outer radius, inner radius | 1.3| 1.9| 2.0%|
| **Photon_trkSumPtSolidConeDR04** | Float_t| Sum of track pT in a cone of dR=0.4 | 1.5| 2.1| 2.2%|
| **Photon_vidNestedWPBitmap** | Int_t| RunIIIWinter22V1 VID compressed bitmap (MinPtCut,PhoSCEtaMultiRangeCut,PhoFull5x5SigmaIEtaIEtaCut,PhoGenericQuadraticRhoPtScaledCut,PhoGenericQuadraticRhoPtScaledCut,PhoGenericQuadraticRhoPtScaledCut,PhoGenericQuadraticRhoPtScaledCut), 2 bits per cut | 1.1| 1.5| 1.6%|
| **Photon_x_calo** | Float_t| photon supercluster position on calorimeter, x coordinate (cm) | 1.9| 2.8| 3.0%|
| **Photon_y_calo** | Float_t| photon supercluster position on calorimeter, y coordinate (cm) | 1.9| 2.8| 3.0%|
| **Photon_z_calo** | Float_t| photon supercluster position on calorimeter, z coordinate (cm) | 1.8| 2.5| 2.7%|
| **nPhoton** | Int_t| slimmedPhotons after basic selection (pt > 5 ) | 0.3| 0.5| 0.5%|

### Pileup
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Pileup_gpudensity** | Float_t| Generator-level PU vertices / mm | 1.0| 1.0| 16.2%|
| **Pileup_nPU** | Int_t| the number of pileup interactions that have been added to the event in the current bunch crossing | 0.9| 0.9| 14.2%|
| **Pileup_nTrueInt** | Float_t| the true mean number of the poisson distribution for this event from which the number of interactions each bunch crossing has been sampled | 1.7| 1.7| 26.0%|
| **Pileup_pudensity** | Float_t| PU vertices / mm | 0.4| 0.4| 6.0%|
| **Pileup_sumEOOT** | Int_t| number of early out of time pileup | 1.4| 1.4| 20.9%|
| **Pileup_sumLOOT** | Int_t| number of late out of time pileup | 1.1| 1.1| 16.8%|

### PuppiMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **PuppiMET_phi** | Float_t| phi | 2.4| 2.4| 7.8%|
| **PuppiMET_phiJERDown** | Float_t| JER down phi | 2.0| 2.0| 6.4%|
| **PuppiMET_phiJERUp** | Float_t| JER up phi | 2.0| 2.0| 6.4%|
| **PuppiMET_phiJESDown** | Float_t| JES down phi | 2.0| 2.0| 6.4%|
| **PuppiMET_phiJESUp** | Float_t| JES up phi | 2.0| 2.0| 6.4%|
| **PuppiMET_phiUnclusteredDown** | Float_t| Unclustered down phi | 2.0| 2.0| 6.4%|
| **PuppiMET_phiUnclusteredUp** | Float_t| Unclustered up phi | 2.0| 2.0| 6.4%|
| **PuppiMET_pt** | Float_t| pt | 3.6| 3.6| 11.5%|
| **PuppiMET_ptJERDown** | Float_t| JER down pt | 1.9| 1.9| 6.1%|
| **PuppiMET_ptJERUp** | Float_t| JER up pt | 1.9| 1.9| 6.1%|
| **PuppiMET_ptJESDown** | Float_t| JES down pt | 1.9| 1.9| 6.1%|
| **PuppiMET_ptJESUp** | Float_t| JES up pt | 1.9| 1.9| 6.0%|
| **PuppiMET_ptUnclusteredDown** | Float_t| Unclustered down pt | 1.9| 1.9| 6.1%|
| **PuppiMET_ptUnclusteredUp** | Float_t| Unclustered up pt | 1.9| 1.9| 6.0%|
| **PuppiMET_sumEt** | Float_t| scalar sum of Et | 1.8| 1.8| 5.8%|

### RawMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **RawMET_phi** | Float_t| phi | 2.0| 2.0| 35.7%|
| **RawMET_pt** | Float_t| pt | 1.9| 1.9| 33.3%|
| **RawMET_sumEt** | Float_t| scalar sum of Et | 1.7| 1.7| 31.1%|

### RawPuppiMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **RawPuppiMET_phi** | Float_t| phi | 2.0| 2.0| 35.2%|
| **RawPuppiMET_pt** | Float_t| pt | 1.9| 1.9| 33.4%|
| **RawPuppiMET_sumEt** | Float_t| scalar sum of Et | 1.8| 1.8| 31.5%|

### Rho
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Rho_fixedGridRhoAll** | Float_t| rho from all PF Candidates, no foreground removal (for isolation of prompt photons) | 3.4| 3.4| 16.5%|
| **Rho_fixedGridRhoFastjetAll** | Float_t| rho from all PF Candidates, used e.g. for JECs | 3.5| 3.5| 17.0%|
| **Rho_fixedGridRhoFastjetCentral** | Float_t| rho from all PF Candidates for central region, used e.g. for JECs | 3.4| 3.4| 16.6%|
| **Rho_fixedGridRhoFastjetCentralCalo** | Float_t| rho from calo towers with \|eta\| < 2.5, used e.g. egamma PFCluster isolation | 3.5| 3.5| 17.1%|
| **Rho_fixedGridRhoFastjetCentralChargedPileUp** | Float_t| rho from charged PF Candidates for central region, used e.g. for JECs | 3.4| 3.4| 16.5%|
| **Rho_fixedGridRhoFastjetCentralNeutral** | Float_t| rho from neutral PF Candidates with \|eta\| < 2.5, used e.g. for rho corrections of some lepton isolations | 3.4| 3.4| 16.2%|

### SV
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SV_charge** | Short_t| sum of the charge of the SV tracks | 0.6| 1.4| 3.2%|
| **SV_chi2** | Float_t| reduced chi2, i.e. chi/ndof | 1.2| 2.7| 6.1%|
| **SV_dlen** | Float_t| decay length in cm | 1.3| 2.9| 6.7%|
| **SV_dlenSig** | Float_t| decay length significance | 1.2| 2.8| 6.5%|
| **SV_dxy** | Float_t| 2D decay length in cm | 1.3| 2.9| 6.7%|
| **SV_dxySig** | Float_t| 2D decay length significance | 1.2| 2.8| 6.5%|
| **SV_eta** | Float_t| eta | 1.5| 3.4| 7.8%|
| **SV_mass** | Float_t| mass | 1.2| 2.8| 6.3%|
| **SV_ndof** | Float_t| number of degrees of freedom | 0.9| 2.2| 4.9%|
| **SV_ntracks** | UChar_t| number of tracks | 0.5| 1.1| 2.6%|
| **SV_pAngle** | Float_t| pointing angle, i.e. acos(p_SV * (SV - PV)) | 0.9| 2.0| 4.6%|
| **SV_phi** | Float_t| phi | 1.5| 3.4| 7.8%|
| **SV_pt** | Float_t| pt | 1.2| 2.8| 6.4%|
| **SV_x** | Float_t| secondary vertex X position, in cm | 1.4| 3.2| 7.3%|
| **SV_y** | Float_t| secondary vertex Y position, in cm | 1.4| 3.2| 7.3%|
| **SV_z** | Float_t| secondary vertex Z position, in cm | 1.5| 3.5| 7.9%|
| **nSV** | Int_t| secondary vertices from IVF algorithm | 0.3| 0.7| 1.6%|

### SoftActivityJet
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJet_eta** | Float_t| eta | 9.9| 1.7| 31.9%|
| **SoftActivityJet_phi** | Float_t| phi | 9.8| 1.7| 31.5%|
| **SoftActivityJet_pt** | Float_t| pt | 11.2| 1.9| 36.0%|
| **nSoftActivityJet** | Int_t| jets clustered from charged candidates compatible with primary vertex (charge()!=0 && pvAssociationQuality()>=5 && vertexRef().key()==0) | 0.2| 0.0| 0.7%|

### SoftActivityJetHT
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJetHT** | Float_t| scalar sum of soft activity jet pt, pt>1 | 3.5| 3.5| 100.0%|

### SoftActivityJetHT10
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJetHT10** | Float_t| scalar sum of soft activity jet pt , pt >10 | 3.0| 3.0| 100.0%|

### SoftActivityJetHT2
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJetHT2** | Float_t| scalar sum of soft activity jet pt, pt >2 | 3.5| 3.5| 100.0%|

### SoftActivityJetHT5
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJetHT5** | Float_t| scalar sum of soft activity jet pt, pt>5 | 3.5| 3.5| 100.0%|

### SoftActivityJetNjets10
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJetNjets10** | Int_t| number of soft activity jet pt, pt >2 | 0.4| 0.4| 100.0%|

### SoftActivityJetNjets2
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJetNjets2** | Int_t| number of soft activity jet pt, pt >10 | 0.7| 0.7| 100.0%|

### SoftActivityJetNjets5
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJetNjets5** | Int_t| number of soft activity jet pt, pt >5 | 0.5| 0.5| 100.0%|

### SubGenJetAK8
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SubGenJetAK8_eta** | Float_t| eta | 0.3| 5.1| 22.1%|
| **SubGenJetAK8_mass** | Float_t| mass | 0.3| 4.7| 20.4%|
| **SubGenJetAK8_phi** | Float_t| phi | 0.3| 5.1| 22.3%|
| **SubGenJetAK8_pt** | Float_t| pt | 0.3| 6.0| 26.2%|
| **nSubGenJetAK8** | Int_t| slimmedGenJetsAK8SoftDropSubJets, i.e. subjets of ak8 Jets made with visible genparticles | 0.1| 2.0| 8.9%|

### SubJet
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SubJet_btagDeepB** | Float_t| DeepCSV b+bb tag discriminator | 0.1| 11.0| 6.6%|
| **SubJet_eta** | Float_t| eta | 0.1| 11.8| 7.1%|
| **SubJet_hadronFlavour** | UChar_t| flavour from hadron ghost clustering | 0.1| 9.0| 5.4%|
| **SubJet_mass** | Float_t| mass | 0.1| 11.7| 7.0%|
| **SubJet_n2b1** | Float_t| N2 with beta=1 | 0.1| 10.8| 6.5%|
| **SubJet_n3b1** | Float_t| N3 with beta=1 | 0.1| 10.6| 6.4%|
| **SubJet_nBHadrons** | UChar_t| number of b-hadrons | 0.1| 8.7| 5.3%|
| **SubJet_nCHadrons** | UChar_t| number of c-hadrons | 0.1| 8.8| 5.3%|
| **SubJet_phi** | Float_t| phi | 0.1| 11.8| 7.1%|
| **SubJet_pt** | Float_t| pt | 0.1| 11.4| 6.9%|
| **SubJet_rawFactor** | Float_t| 1 - Factor to get back to raw pT | 0.1| 10.6| 6.4%|
| **SubJet_tau1** | Float_t| Nsubjettiness (1 axis) | 0.1| 11.2| 6.7%|
| **SubJet_tau2** | Float_t| Nsubjettiness (2 axis) | 0.1| 11.0| 6.6%|
| **SubJet_tau3** | Float_t| Nsubjettiness (3 axis) | 0.1| 10.6| 6.4%|
| **SubJet_tau4** | Float_t| Nsubjettiness (4 axis) | 0.1| 10.5| 6.3%|
| **nSubJet** | Int_t| slimmedJetsAK8, i.e. ak8 fat jets for boosted analysis | 0.1| 6.7| 4.0%|

### Tau
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Tau_charge** | Short_t| electric charge | 0.8| 0.7| 0.8%|
| **Tau_chargedIso** | Float_t| charged isolation | 2.2| 1.9| 2.2%|
| **Tau_decayMode** | UChar_t| decayMode() | 0.9| 0.7| 0.9%|
| **Tau_decayModePNet** | Short_t| decay mode of the highest tau score of ParticleNet | 1.0| 0.8| 1.0%|
| **Tau_dxy** | Float_t| d_{xy} of lead track with respect to PV, in cm (with sign) | 3.2| 2.7| 3.1%|
| **Tau_dz** | Float_t| d_{z} of lead track with respect to PV, in cm (with sign) | 3.7| 3.1| 3.6%|
| **Tau_eleIdx** | Short_t(index to Ele)| index of first matching electron | 0.9| 0.8| 0.9%|
| **Tau_eta** | Float_t| eta | 3.5| 2.9| 3.4%|
| **Tau_genPartFlav** | UChar_t| Flavour of genParticle (DressedLeptons for electrons) for MC matching to status==2 taus: 1 = prompt electron, 2 = prompt muon, 3 = tau->e decay, 4 = tau->mu decay, 5 = hadronic tau decay, 0 = unknown or unmatched | 1.0| 0.8| 1.0%|
| **Tau_genPartIdx** | Short_t(index to Genpart)| Index into genParticle list for MC matching to status==2 taus | 1.3| 1.1| 1.3%|
| **Tau_idAntiEleDeadECal** | Bool_t| Anti-electron dead-ECal discriminator | 0.7| 0.6| 0.7%|
| **Tau_idAntiMu** | UChar_t| Anti-muon discriminator V3: : 1 = Loose, 2 = Tight | 0.8| 0.7| 0.8%|
| **Tau_idDecayModeNewDMs** | Bool_t| (?isTauIDAvailable("decayModeFindingNewDMs")?tauID("decayModeFindingNewDMs"):-1) > 0 | 0.7| 0.6| 0.7%|
| **Tau_idDecayModeOldDMs** | Bool_t| (?isTauIDAvailable("decayModeFinding")?tauID("decayModeFinding"):-1) > 0 | 0.8| 0.6| 0.7%|
| **Tau_idDeepTau2017v2p1VSe** | UChar_t| byDeepTau2017v2p1VSe ID working points (deepTau2017v2p1): 1 = VVVLoose, 2 = VVLoose, 3 = VLoose, 4 = Loose, 5 = Medium, 6 = Tight, 7 = VTight, 8 = VVTight | 1.0| 0.9| 1.0%|
| **Tau_idDeepTau2017v2p1VSjet** | UChar_t| byDeepTau2017v2p1VSjet ID working points (deepTau2017v2p1): 1 = VVVLoose, 2 = VVLoose, 3 = VLoose, 4 = Loose, 5 = Medium, 6 = Tight, 7 = VTight, 8 = VVTight | 1.1| 0.9| 1.1%|
| **Tau_idDeepTau2017v2p1VSmu** | UChar_t| byDeepTau2017v2p1VSmu ID working points (deepTau2017v2p1): 1 = VLoose, 2 = Loose, 3 = Medium, 4 = Tight | 0.9| 0.8| 0.9%|
| **Tau_idDeepTau2018v2p5VSe** | UChar_t| byDeepTau2018v2p5VSe ID working points (deepTau2018v2p5): 1 = VVVLoose, 2 = VVLoose, 3 = VLoose, 4 = Loose, 5 = Medium, 6 = Tight, 7 = VTight, 8 = VVTight | 0.8| 0.7| 0.8%|
| **Tau_idDeepTau2018v2p5VSjet** | UChar_t| byDeepTau2018v2p5VSjet ID working points (deepTau2018v2p5): 1 = VVVLoose, 2 = VVLoose, 3 = VLoose, 4 = Loose, 5 = Medium, 6 = Tight, 7 = VTight, 8 = VVTight | 0.9| 0.8| 0.9%|
| **Tau_idDeepTau2018v2p5VSmu** | UChar_t| byDeepTau2018v2p5VSmu ID working points (deepTau2018v2p5): 1 = VLoose, 2 = Loose, 3 = Medium, 4 = Tight | 0.9| 0.8| 0.9%|
| **Tau_jetIdx** | Short_t(index to Jet)| index of the associated jet (-1 if none) | 1.0| 0.8| 1.0%|
| **Tau_leadTkDeltaEta** | Float_t| eta of the leading track, minus tau eta | 2.8| 2.4| 2.7%|
| **Tau_leadTkDeltaPhi** | Float_t| phi of the leading track, minus tau phi | 2.8| 2.4| 2.8%|
| **Tau_leadTkPtOverTauPt** | Float_t| pt of the leading track divided by tau pt | 2.0| 1.6| 1.9%|
| **Tau_mass** | Float_t| mass | 1.7| 1.4| 1.7%|
| **Tau_muIdx** | Short_t(index to Mu)| index of first matching muon | 0.9| 0.7| 0.9%|
| **Tau_nSVs** | UChar_t| number of secondary vertices in the tau | 0.7| 0.6| 0.7%|
| **Tau_neutralIso** | Float_t| neutral (photon) isolation | 1.5| 1.3| 1.5%|
| **Tau_phi** | Float_t| phi | 3.5| 2.9| 3.4%|
| **Tau_photonsOutsideSignalCone** | Float_t| sum of photons outside signal cone | 1.3| 1.1| 1.2%|
| **Tau_probDM0PNet** | Float_t| normalised probablity of decayMode 0, 1h+0pi0 (PNet 2023) | 2.9| 2.4| 2.8%|
| **Tau_probDM10PNet** | Float_t| normalised probablity of decayMode 10, 3h+0pi0 (PNet 2023) | 3.2| 2.7| 3.1%|
| **Tau_probDM11PNet** | Float_t| normalised probablity of decayMode 11, 3h+1pi0 (PNet 2023) | 3.2| 2.6| 3.1%|
| **Tau_probDM1PNet** | Float_t| normalised probablity of decayMode 1, 1h+1pi0 (PNet 2023) | 2.8| 2.4| 2.7%|
| **Tau_probDM2PNet** | Float_t| normalised probablity of decayMode 2, 1h+2pi0 (PNet 2023) | 3.0| 2.5| 2.9%|
| **Tau_pt** | Float_t| pt | 4.8| 4.0| 4.6%|
| **Tau_ptCorrPNet** | Float_t| pt correction (PNet 2023) | 2.0| 1.6| 1.9%|
| **Tau_puCorr** | Float_t| pileup correction | 2.7| 2.3| 2.7%|
| **Tau_qConfPNet** | Float_t| signed charge confidence (PNet 2023) | 2.7| 2.3| 2.6%|
| **Tau_rawDeepTau2017v2p1VSe** | Float_t| byDeepTau2017v2p1VSe raw output discriminator (deepTau2017v2p1) | 2.6| 2.2| 2.5%|
| **Tau_rawDeepTau2017v2p1VSjet** | Float_t| byDeepTau2017v2p1VSjet raw output discriminator (deepTau2017v2p1) | 2.2| 1.9| 2.2%|
| **Tau_rawDeepTau2017v2p1VSmu** | Float_t| byDeepTau2017v2p1VSmu raw output discriminator (deepTau2017v2p1) | 2.7| 2.3| 2.7%|
| **Tau_rawDeepTau2018v2p5VSe** | Float_t| byDeepTau2018v2p5VSe raw output discriminator (deepTau2018v2p5) | 2.8| 2.4| 2.8%|
| **Tau_rawDeepTau2018v2p5VSjet** | Float_t| byDeepTau2018v2p5VSjet raw output discriminator (deepTau2018v2p5) | 2.9| 2.4| 2.8%|
| **Tau_rawDeepTau2018v2p5VSmu** | Float_t| byDeepTau2018v2p5VSmu raw output discriminator (deepTau2018v2p5) | 2.7| 2.2| 2.6%|
| **Tau_rawIso** | Float_t| combined isolation (deltaBeta corrections) | 2.3| 1.9| 2.2%|
| **Tau_rawIsodR03** | Float_t| combined isolation (deltaBeta corrections, dR=0.3) | 1.8| 1.5| 1.7%|
| **Tau_rawPNetVSe** | Float_t| raw output of ParticleNetVsE discriminator (PNet 2023) | 2.9| 2.4| 2.8%|
| **Tau_rawPNetVSjet** | Float_t| raw output of ParticleNetVsJet discriminator (PNet 2023) | 3.0| 2.5| 2.9%|
| **Tau_rawPNetVSmu** | Float_t| raw output of ParticleNetVsMu discriminator (PNet 2023) | 2.5| 2.1| 2.5%|
| **Tau_svIdx1** | Short_t(index to Sv)| index of first matching secondary vertex | 0.7| 0.6| 0.7%|
| **Tau_svIdx2** | Short_t(index to Sv)| index of second matching secondary vertex | 0.6| 0.5| 0.6%|
| **nTau** | Int_t| slimmedTaus after basic selection (pt > 18 && ((tauID("decayModeFindingNewDMs") > 0.5 && (tauID("byLooseCombinedIsolationDeltaBetaCorr3Hits") \|\| (tauID("chargedIsoPtSumdR03")+max(0.,tauID("neutralIsoPtSumdR03")-0.072*tauID("puCorrPtSum"))<2.5) \|\| tauID("byVVVLooseDeepTau2017v2p1VSjet") \|\| tauID("byVVVLooseDeepTau2018v2p5VSjet"))) \|\| (?isTauIDAvailable("byPNetVSjetraw")?tauID("byPNetVSjetraw"):-1) > 0.05)) | 0.4| 0.3| 0.4%|

### TkMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **TkMET_phi** | Float_t| raw track MET phi | 2.0| 2.0| 34.7%|
| **TkMET_pt** | Float_t| raw track MET pt | 1.9| 1.9| 33.7%|
| **TkMET_sumEt** | Float_t| raw track scalar sum of Et | 1.8| 1.8| 31.7%|

### TrigObj
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **TrigObj_eta** | Float_t| eta | 4.1| 2.1| 17.1%|
| **TrigObj_filterBits** | Int_t| extra bits of associated information: 0 => HLT_AK8PFJetX_SoftDropMass40_PFAK8ParticleNetTauTau0p30, 1 => hltAK8SinglePFJets230SoftDropMass40PNetTauTauTag0p03 for BoostedTau; 0 => CaloIdL_TrackIdL_IsoVL, 1 => 1e (WPTight), 2 => 1e (WPLoose), 3 => OverlapFilter PFTau, 4 => 2e, 5 => 1e-1mu, 6 => 1e-1tau, 7 => 3e, 8 => 2e-1mu, 9 => 1e-2mu, 10 => 1e (32_L1DoubleEG_AND_L1SingleEGOr), 11 => 1e (CaloIdVT_GsfTrkIdT), 12 => 1e (PFJet), 13 => 1e (Photon175_OR_Photon200) for Electron; 0 => , 1 => hltAK8SingleCaloJet200, 2 => , 3 => hltAK8SinglePFJets230SoftDropMass40BTagParticleNetBB0p35 OR hltAK8SinglePFJets250SoftDropMass40BTagParticleNetBB0p35 OR hltAK8SinglePFJets275SoftDropMass40BTagParticleNetBB0p35, 4 => hltAK8DoublePFJetSDModMass30, 5 => hltAK8DoublePFJetSDModMass50 for FatJet; 0 => hltL1sTripleJetVBFIorHTTIorDoubleJetCIorSingleJet, 1 => hltL1sQuadJetC50IorQuadJetC60IorHTT280IorHTT300IorHTT320IorTripleJet846848VBFIorTripleJet887256VBFIorTripleJet927664VBF OR hltL1sQuadJetCIorTripleJetVBFIorHTT, 2 => hltL1sQuadJetC60IorHTT380IorHTT280QuadJetIorHTT300QuadJet OR hltL1sQuadJetC50to60IorHTT280to500IorHTT250to340QuadJet, 3 => hltCaloQuadJet30HT300 OR hltCaloQuadJet30HT320, 4 => hltPFCentralJetsLooseIDQuad30HT300 OR hltPFCentralJetsLooseIDQuad30HT330, 5 => hltPFHT280Jet30 for HT; 0 => hlt4PixelOnlyPFCentralJetTightIDPt20, 1 => hlt3PixelOnlyPFCentralJetTightIDPt30, 2 => hltPFJetFilterTwoC30, 3 => hlt4PFCentralJetTightIDPt30, 4 => hlt4PFCentralJetTightIDPt35, 5 => hltQuadCentralJet30, 6 => hlt2PixelOnlyPFCentralJetTightIDPt40, 7 => hltL1sTripleJet1008572VBFIorHTTIorDoubleJetCIorSingleJet OR hltL1sTripleJet1058576VBFIorHTTIorDoubleJetCIorSingleJet OR hltL1sTripleJetVBFIorHTTIorSingleJet, 8 => hlt3PFCentralJetTightIDPt40, 9 => hlt3PFCentralJetTightIDPt45, 10 => hltL1sQuadJetC60IorHTT380IorHTT280QuadJetIorHTT300QuadJet OR hltL1sQuadJetC50to60IorHTT280to500IorHTT250to340QuadJet, 11 => hltBTagCaloDeepCSVp17Double, 12 => hltPFCentralJetLooseIDQuad30, 13 => hlt1PFCentralJetLooseID75, 14 => hlt2PFCentralJetLooseID60, 15 => hlt3PFCentralJetLooseID45, 16 => hlt4PFCentralJetLooseID40, 17 => (Double tau + jet) hltHpsOverlapFilterDeepTauDoublePFTau*PFJet*, 18 => (VBF cross-cleaned from medium deeptau PFTau) *CrossCleaned*MediumDeepTauDitauWPPFTau*, 19 => (VBF cross-cleaned using dijet correlation checker) *CrossCleanedUsingDiJetCorrChecker*, 20 => (monitoring muon + tau + jet)  hltHpsOverlapFilterDeepTauPFTau*PFJet*, 21 => hlt2PFCentralJetTightIDPt50, 22 => hlt1PixelOnlyPFCentralJetTightIDPt60, 23 => hlt1PFCentralJetTightIDPt70, 24 => hltBTagPFDeepJet1p5Single, 25 => hltBTagPFDeepJet4p5Triple, 26 => hltBTagCentralJetPt35PFParticleNet2BTagSum0p65 OR hltBTagCentralJetPt30PFParticleNet2BTagSum0p65 OR hltPFJetTwoC30PFBTagParticleNet2BTagSum0p65 OR hltPFCentralJetPt30PNet2BTagMean0p55, 27 => hlt2PixelOnlyPFCentralJetTightIDPt20 OR hlt1PixelOnlyPFCentralJetTightIDPt50, 28 => hlt2PFCentralJetTightIDPt30 OR hltPF2CentralJetTightIDPt30, 29 => hlt1PFCentralJetTightIDPt60, 30 => hltPF2CentralJetPt30PNet2BTagMean0p50 for Jet; 0 => hltCaloQuadJet30HT300 OR hltCaloQuadJet30HT320, 1 => hltPFCentralJetsLooseIDQuad30HT300 OR hltPFCentralJetsLooseIDQuad30HT330 for MHT; 0 => TrkIsoVVL, 1 => Iso, 2 => OverlapFilter PFTau, 3 => 1mu, 4 => 2mu, 5 => 1mu-1e, 6 => 1mu-1tau, 7 => 3mu, 8 => 2mu-1e, 9 => 1mu-2e, 10 => 1mu (Mu50), 11 => 1mu (Mu100), 12 => 1mu-1photon for Muon; 0 => hltEG33L1EG26HEFilter, 1 => hltEG50HEFilter, 2 => hltEG75HEFilter, 3 => hltEG90HEFilter, 4 => hltEG120HEFilter, 5 => hltEG150HEFilter, 6 => hltEG150HEFilter, 7 => hltEG200HEFilter, 8 => hltHtEcal800, 9 => hltEG110EBTightIDTightIsoTrackIsoFilter, 10 => hltEG120EBTightIDTightIsoTrackIsoFilter, 11 => 1mu-1photon, 12 => hltEG30LR9Id85b90eHE12R9Id50b80eR9IdLastFilter, 13 => hltEG30LIso60CaloId15b35eHE12R9Id50b80eEcalIsoLastFilter, 14 => hltEG22Iso60CaloId15b35eHE12R9Id50b80eTrackIsoUnseededLastFilter, 15 => hltEG22R9Id85b90eHE12R9Id50b80eR9UnseededLastFilter, 16 => hltEG30Iso60CaloId15b35eR9Id50b90eHE12b10eR9Id50b80eEcalIsoFilter, 17 => hltEG18TrackIso60Iso60CaloId15b35eR9Id50b90eHE12b10eR9Id50b80eTrackIsoUnseededFilter for Photon; 0 => LooseChargedIso, 1 => MediumChargedIso, 2 => TightChargedIso, 3 => DeepTau, 4 => TightID OOSC photons, 5 => HPS, 6 => charged iso di-tau, 7 => deeptau di-tau, 8 => e-tau, 9 => mu-tau, 10 => single-tau/tau+MET, 11 => run 2 VBF+ditau, 12 => run 3 VBF+ditau, 13 => run 3 double PF jets + ditau, 14 => di-tau + PFJet, 15 => Displaced Tau, 16 => Monitoring, 17 => regional paths, 18 => L1 seeded paths, 19 => 1 prong tau paths for Tau; | 2.2| 1.1| 9.3%|
| **TrigObj_id** | UShort_t| ID of the object: 1515 = BoostedTau, 11 = Electron(PixelMatched e/gamma), 6 = FatJet, 3 = HT, 1 = Jet, 2 = MET, 4 = MHT, 13 = Muon, 22 = Photon, 15 = Tau | 1.1| 0.6| 4.7%|
| **TrigObj_l1charge** | Short_t| charge of associated L1 seed | 1.0| 0.5| 4.0%|
| **TrigObj_l1iso** | Int_t| iso of associated L1 seed | 1.2| 0.6| 5.0%|
| **TrigObj_l1pt** | Float_t| pt of associated L1 seed | 2.7| 1.4| 11.3%|
| **TrigObj_l1pt_2** | Float_t| pt of associated secondary L1 seed | 0.7| 0.4| 3.1%|
| **TrigObj_l2pt** | Float_t| pt of associated "L2" seed (i.e. HLT before tracking/PF) | 2.3| 1.2| 9.7%|
| **TrigObj_phi** | Float_t| phi | 4.1| 2.1| 17.1%|
| **TrigObj_pt** | Float_t| pt | 4.0| 2.0| 16.7%|
| **nTrigObj** | Int_t|  | 0.5| 0.3| 2.1%|

### boostedTau
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **boostedTau_charge** | Int_t| electric charge | 0.2| 2.7| 2.8%|
| **boostedTau_chargedIso** | Float_t| charged isolation | 0.4| 4.2| 4.2%|
| **boostedTau_decayMode** | Int_t| decayMode() | 0.2| 2.6| 2.7%|
| **boostedTau_eta** | Float_t| eta | 0.5| 5.2| 5.3%|
| **boostedTau_genPartFlav** | UChar_t| Flavour of genParticle (DressedLeptons for electrons) for MC matching to status==2 taus: 1 = prompt electron, 2 = prompt muon, 3 = tau->e decay, 4 = tau->mu decay, 5 = hadronic tau decay, 0 = unknown or unmatched | 0.2| 2.7| 2.7%|
| **boostedTau_genPartIdx** | Short_t(index to Genpart)| Index into genParticle list for MC matching to status==2 taus | 0.3| 3.2| 3.3%|
| **boostedTau_idAntiEle2018** | UChar_t| Anti-electron MVA discriminator V6 (2018): 1 = VLoose, 2 = Loose, 3 = Medium, 4 = Tight, 5 = VTight | 0.2| 2.8| 2.9%|
| **boostedTau_idAntiMu** | UChar_t| Anti-muon discriminator V3: : 1 = Loose, 2 = Tight | 0.2| 2.6| 2.6%|
| **boostedTau_idMVAnewDM2017v2** | UChar_t| IsolationMVArun2DBnewDMwLT ID working point (2017v2): 1 = VVLoose, 2 = VLoose, 3 = Loose, 4 = Medium, 5 = Tight, 6 = VTight, 7 = VVTight | 0.2| 2.9| 2.9%|
| **boostedTau_idMVAoldDM2017v2** | UChar_t| IsolationMVArun2DBoldDMwLT ID working point (2017v2): 1 = VVLoose, 2 = VLoose, 3 = Loose, 4 = Medium, 5 = Tight, 6 = VTight, 7 = VVTight | 0.3| 2.9| 3.0%|
| **boostedTau_jetIdx** | Short_t(index to Jet)| index of the associated jet (-1 if none) | 0.2| 2.6| 2.7%|
| **boostedTau_leadTkDeltaEta** | Float_t| eta of the leading track, minus tau eta | 0.4| 4.6| 4.6%|
| **boostedTau_leadTkDeltaPhi** | Float_t| phi of the leading track, minus tau phi | 0.4| 4.6| 4.7%|
| **boostedTau_leadTkPtOverTauPt** | Float_t| pt of the leading track divided by tau pt | 0.3| 3.4| 3.5%|
| **boostedTau_mass** | Float_t| mass | 0.3| 2.9| 2.9%|
| **boostedTau_neutralIso** | Float_t| neutral (photon) isolation | 0.3| 3.5| 3.5%|
| **boostedTau_phi** | Float_t| phi | 0.5| 5.2| 5.3%|
| **boostedTau_photonsOutsideSignalCone** | Float_t| sum of photons outside signal cone | 0.3| 3.1| 3.1%|
| **boostedTau_pt** | Float_t| pt | 0.5| 5.8| 5.9%|
| **boostedTau_puCorr** | Float_t| pileup correction | 0.4| 4.6| 4.6%|
| **boostedTau_rawAntiEle2018** | Float_t| Anti-electron MVA discriminator V6 raw output discriminator (2018) | 0.4| 4.8| 4.9%|
| **boostedTau_rawAntiEleCat2018** | Short_t| Anti-electron MVA discriminator V6 category (2018) | 0.3| 3.0| 3.0%|
| **boostedTau_rawIso** | Float_t| combined isolation (deltaBeta corrections) | 0.4| 4.1| 4.2%|
| **boostedTau_rawIsodR03** | Float_t| combined isolation (deltaBeta corrections, dR=0.3) | 0.3| 3.6| 3.7%|
| **boostedTau_rawMVAnewDM2017v2** | Float_t| byIsolationMVArun2DBnewDMwLT raw output discriminator (2017v2) | 0.4| 4.5| 4.6%|
| **boostedTau_rawMVAoldDM2017v2** | Float_t| byIsolationMVArun2DBoldDMwLT raw output discriminator (2017v2) | 0.4| 4.5| 4.6%|
| **nboostedTau** | Int_t| slimmedBoostedTaus after basic selection (pt > 40 && tauID("decayModeFindingNewDMs") && (tauID("byVVLooseIsolationMVArun2DBoldDMwLT") \|\| tauID("byVVLooseIsolationMVArun2DBnewDMwLT"))) | 0.2| 2.0| 2.0%|

### bunchCrossing
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **bunchCrossing** | UInt_t| bunchCrossing/i | 0.1| 0.1| 100.0%|

### event
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **event** | ULong64_t| event/l | 0.9| 0.9| 100.0%|

### genTtbarId
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **genTtbarId** | Int_t| ttbar categorization | 0.1| 0.1| 100.0%|

### genWeight
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **genWeight** | Float_t| generator weight | 0.1| 0.1| 100.0%|

### luminosityBlock
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **luminosityBlock** | UInt_t| luminosityBlock/i | 0.1| 0.1| 100.0%|

### run
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **run** | UInt_t| run/i | 0.1| 0.1| 100.0%|

