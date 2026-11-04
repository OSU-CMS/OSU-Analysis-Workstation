**v15_egamma1_data.root (1428.787 Mb, 943436 events, 1.55 kb/event)**

# LuminosityBlocks Content

| Collection | Description | kb/evt | % of tree |
| - | - | - | - |
| **betaStar** | LHC beta star | 0.000| 21.4%|
| **crossingAngle** | LHC crossing angle | 0.000| 15.9%|
| **energy** | LHC beam energy | 0.000| 16.4%|
| **luminosityBlock** | luminosityBlock/i | 0.000| 29.2%|
| **run** | run/i | 0.000| 17.1%|

# LuminosityBlocks detail

### betaStar
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **betaStar** | Double_t| LHC beta star | 0.0| 2.1| 100.0%|

### crossingAngle
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **crossingAngle** | Double_t| LHC crossing angle | 0.0| 1.6| 100.0%|

### energy
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **energy** | Double_t| LHC beam energy | 0.0| 1.6| 100.0%|

### luminosityBlock
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **luminosityBlock** | UInt_t| luminosityBlock/i | 0.0| 2.9| 100.0%|

### run
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **run** | UInt_t| run/i | 0.0| 1.7| 100.0%|

# Events Content

| Collection | Description | kb/evt | % of tree |
| - | - | - | - |
| **BeamSpot** | BeamSpot type (Unknown = -1, Fake = 0, LHC = 1, Tracker = 2) | 0.000| 0.0%|
| **CaloMET** | phi | 0.005| 0.3%|
| **CorrT1METJet** | Additional low-pt ak4 Puppi jets for Type-1 MET re-correction | 0.042| 2.7%|
| **DST** | Trigger/flag bit (process: HLT) | 0.001| 0.1%|
| **Dataset** | Trigger/flag bit (process: HLT) | 0.000| 0.0%|
| **DeepMETResolutionTune** | DeepmET ResolutionTune phi | 0.006| 0.4%|
| **DeepMETResponseTune** | DeepMET ResponseTune phi | 0.006| 0.4%|
| **Electron** | slimmedElectrons after basic selection (pt > 5 ) | 0.124| 8.1%|
| **FatJet** | slimmedJetsAK8, i.e. ak8 fat jets for boosted analysis | 0.039| 2.5%|
| **FatJetPFCand** | Index in the PFCand table | 0.004| 0.2%|
| **Flag** | Trigger/flag bit (process: PAT) | 0.003| 0.2%|
| **FsrPhoton** | Final state radiation photons emitted by muons or electrons | 0.002| 0.1%|
| **HLT** | Trigger/flag bit (process: HLT) | 0.034| 2.2%|
| **HLTriggerFinalPath** | Trigger/flag bit (process: HLT) | 0.000| 0.0%|
| **HLTriggerFirstPath** | Trigger/flag bit (process: HLT) | 0.000| 0.0%|
| **IsoTrack** | isolated tracks after basic selection (((pt>5 && (abs(pdgId) == 11 \|\| abs(pdgId) == 13)) \|\| pt > 10) && (abs(pdgId) < 15 \|\| abs(eta) < 2.5) && ((abs(dxy) < 0.2 && abs(dz) < 0.1) \|\| pt>15) && ((pfIsolationDR03().chargedHadronIso < 5 && pt < 25) \|\| pfIsolationDR03().chargedHadronIso/pt < 0.2)) and lepton veto | 0.015| 1.0%|
| **Jet** | slimmedJetsPuppi, i.e. ak4 PFJets Puppi with JECs applied, after basic selection (pt > 15) | 0.344| 22.3%|
| **L1** | Trigger/flag bit (process: PAT) | 0.047| 3.0%|
| **L1Reco** | Trigger/flag bit (process: RECO) | 0.000| 0.0%|
| **LowPtElectron** | slimmedLowPtElectrons after basic selection (pt > 1. && electronID("ID") > -0.25) | 0.051| 3.3%|
| **Muon** | slimmedMuons after basic selection (pt > 15 \|\| (pt > 3 && (passed("CutBasedIdLoose") \|\| passed("SoftCutBasedId") \|\| passed("SoftMvaId") \|\| passed("CutBasedIdGlobalHighPt") \|\| passed("CutBasedIdTrkHighPt")))) | 0.061| 3.9%|
| **OtherPV** | Z position of other primary vertices, excluding the main PV | 0.011| 0.7%|
| **PFCand** | PF candidate constituents of AK8 puppi jets (FatJet) with \|eta\| <= 2.5 | 0.029| 1.9%|
| **PFMET** | xx element of met covariance matrix | 0.023| 1.5%|
| **PPSLocalTrack** | ppsLocalTrack variables | 0.027| 1.8%|
| **PV** | total number of reconstructed primary vertices | 0.016| 1.0%|
| **PVBS** | main primary vertex with beam-spot | 0.023| 1.5%|
| **Photon** | slimmedPhotons after basic selection (pt > 5 ) | 0.133| 8.6%|
| **Proton** | 0 = sector45, 1 = sector56 | 0.020| 1.3%|
| **PuppiMET** | xx element of met covariance matrix | 0.023| 1.5%|
| **RawPFMET** | phi | 0.008| 0.5%|
| **RawPuppiMET** | phi | 0.008| 0.5%|
| **Rho** | rho from all PF Candidates, no foreground removal (for isolation of prompt photons) | 0.019| 1.2%|
| **SV** | secondary vertices from IVF algorithm | 0.034| 2.2%|
| **SoftActivityJet** | jets clustered from charged candidates compatible with primary vertex (charge()!=0 && pvAssociationQuality()>=5 && vertexRef().key()==0) | 0.031| 2.0%|
| **SoftActivityJetHT** | scalar sum of soft activity jet pt, pt>1 | 0.003| 0.2%|
| **SoftActivityJetHT10** | scalar sum of soft activity jet pt , pt >10 | 0.003| 0.2%|
| **SoftActivityJetHT2** | scalar sum of soft activity jet pt, pt >2 | 0.003| 0.2%|
| **SoftActivityJetHT5** | scalar sum of soft activity jet pt, pt>5 | 0.003| 0.2%|
| **SoftActivityJetNjets10** | number of soft activity jet pt, pt >2 | 0.000| 0.0%|
| **SoftActivityJetNjets2** | number of soft activity jet pt, pt >10 | 0.001| 0.0%|
| **SoftActivityJetNjets5** | number of soft activity jet pt, pt >5 | 0.000| 0.0%|
| **SubJet** | slimmedJetsAK8PFPuppiSoftDropPacked::SubJets, i.e. soft-drop subjets for ak8 fat jets for boosted analysis | 0.026| 1.7%|
| **Tau** | slimmedTaus after basic selection (pt > 18 && ((tauID("decayModeFindingNewDMs") > 0.5 && (tauID("byLooseCombinedIsolationDeltaBetaCorr3Hits") \|\| (tauID("chargedIsoPtSumdR03")+max(0.,tauID("neutralIsoPtSumdR03")-0.072*tauID("puCorrPtSum"))<2.5) \|\| tauID("byVVVLooseDeepTau2018v2p5VSjet"))) \|\| (?isTauIDAvailable("byUTagCHSVSjetraw")?tauID("byUTagCHSVSjetraw"):-1) > 0.05 \|\| (?isTauIDAvailable("byUTagPUPPIVSjetraw")?tauID("byUTagPUPPIVSjetraw"):-1) > 0.05)) | 0.112| 7.3%|
| **TauProd** | tau signal candidates | 0.017| 1.1%|
| **TrigObj** | charge of associated L1 seed | 0.153| 9.9%|
| **TrkMET** | raw track MET phi | 0.006| 0.4%|
| **boostedTau** | slimmedBoostedTaus after basic selection (pt > 25 && tauID("decayModeFindingNewDMs") && (tauID("byVVLooseIsolationMVArun2DBoldDMwLT") \|\| tauID("byVVLooseIsolationMVArun2DBnewDMwLT") \|\| tauID("byBoostedDeepTau20161718v2p0VSjetraw") > 0.82)) | 0.021| 1.3%|
| **bunchCrossing** | bunchCrossing/i | 0.002| 0.1%|
| **event** | event/l | 0.003| 0.2%|
| **luminosityBlock** | luminosityBlock/i | 0.000| 0.0%|
| **orbitNumber** | orbitNumber/i | 0.002| 0.1%|
| **run** | run/i | 0.000| 0.0%|

# Events detail

### BeamSpot
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **BeamSpot_sigmaZ** | Float_t| Width of BeamSpot in z (cm) | 0.0| 0.0| 20.4%|
| **BeamSpot_sigmaZError** | Float_t| Error on width of BeamSpot in z (cm) | 0.0| 0.0| 20.9%|
| **BeamSpot_type** | Short_t| BeamSpot type (Unknown = -1, Fake = 0, LHC = 1, Tracker = 2) | 0.0| 0.0| 18.3%|
| **BeamSpot_z** | Float_t| BeamSpot center, z coordinate (cm) | 0.0| 0.0| 20.0%|
| **BeamSpot_zError** | Float_t| Error on BeamSpot center, z coordinate (cm) | 0.0| 0.0| 20.4%|

### CaloMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **CaloMET_phi** | Float_t| phi | 2.0| 2.0| 37.3%|
| **CaloMET_pt** | Float_t| pt | 1.8| 1.8| 33.9%|
| **CaloMET_sumEt** | Float_t| scalar sum of Et | 1.6| 1.6| 28.8%|

### CorrT1METJet
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **CorrT1METJet_EmEF** | Float_t| charged+neutral Electromagnetic Energy Fraction | 2.8| 1.0| 6.5%|
| **CorrT1METJet_area** | Float_t| jet catchment area, for JECs | 3.3| 1.2| 7.7%|
| **CorrT1METJet_eta** | Float_t| eta | 7.0| 2.5| 16.4%|
| **CorrT1METJet_muonSubtrDeltaEta** | Float_t| muon-subtracted raw eta - eta | 4.0| 1.4| 9.3%|
| **CorrT1METJet_muonSubtrDeltaPhi** | Float_t| muon-subtracted raw phi - phi | 1.8| 0.6| 4.2%|
| **CorrT1METJet_muonSubtrFactor** | Float_t| 1-(muon-subtracted raw pt)/(raw pt) | 4.9| 1.7| 11.4%|
| **CorrT1METJet_phi** | Float_t| phi | 7.2| 2.5| 16.8%|
| **CorrT1METJet_rawMass** | Float_t| mass()*jecFactor("Uncorrected") | 6.1| 2.1| 14.2%|
| **CorrT1METJet_rawPt** | Float_t| pt()*jecFactor("Uncorrected") | 5.3| 1.9| 12.4%|
| **nCorrT1METJet** | Int_t| Additional low-pt ak4 Puppi jets for Type-1 MET re-correction | 0.5| 0.2| 1.2%|

### DST
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **DST_PFScouting_AXOLoose** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 4.6%|
| **DST_PFScouting_AXONominal** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 5.0%|
| **DST_PFScouting_AXOTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 4.9%|
| **DST_PFScouting_AXOVLoose** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 4.7%|
| **DST_PFScouting_AXOVTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 4.7%|
| **DST_PFScouting_DatasetMuon** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 5.5%|
| **DST_PFScouting_DoubleEG** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 12.5%|
| **DST_PFScouting_DoubleMuon** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 5.2%|
| **DST_PFScouting_JetHT** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 18.0%|
| **DST_PFScouting_SingleMuon** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 5.8%|
| **DST_PFScouting_SinglePhotonEB** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 24.4%|
| **DST_PFScouting_ZeroBias** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 4.7%|

### Dataset
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Dataset_ScoutingPFMonitor** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 21.7%|
| **Dataset_ScoutingPFRun3** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 78.3%|

### DeepMETResolutionTune
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **DeepMETResolutionTune_phi** | Float_t| DeepmET ResolutionTune phi | 2.4| 2.4| 40.0%|
| **DeepMETResolutionTune_pt** | Float_t| DeepMET ResolutionTune pt | 3.6| 3.6| 60.0%|

### DeepMETResponseTune
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **DeepMETResponseTune_phi** | Float_t| DeepMET ResponseTune phi | 2.4| 2.4| 40.0%|
| **DeepMETResponseTune_pt** | Float_t| DeepMET ResponseTune pt | 3.6| 3.6| 60.0%|

### Electron
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Electron_IPx** | Float_t| x coordinate of impact parameter vector | 2.2| 2.6| 1.7%|
| **Electron_IPy** | Float_t| y coordinate of impact parameter vector | 2.2| 2.6| 1.7%|
| **Electron_IPz** | Float_t| z coordinate of impact parameter vector | 2.2| 2.6| 1.7%|
| **Electron_PreshowerEnergy** | Float_t| energy deposited in preshower | 1.5| 1.9| 1.2%|
| **Electron_charge** | Int_t| electric charge | 0.8| 1.0| 0.6%|
| **Electron_convVeto** | Bool_t| pass conversion veto | 0.6| 0.8| 0.5%|
| **Electron_cutBased** | UChar_t| cut-based ID RunIII Winter22: fail ==0, veto >=1 (to veto, ask for <1), loose >=2, medium >=3, tight >=4 | 0.9| 1.0| 0.7%|
| **Electron_cutBased_HEEP** | Bool_t| cut-based HEEP ID | 0.7| 0.8| 0.5%|
| **Electron_deltaEtaSC** | Float_t| delta eta (SC,ele) with sign | 2.4| 2.9| 1.9%|
| **Electron_dr03EcalRecHitSumEt** | Float_t| Non-PF Ecal isolation within a delta R cone of 0.3 with electron pt > 35 GeV | 1.4| 1.6| 1.1%|
| **Electron_dr03HcalDepth1TowerSumEt** | Float_t| Non-PF Hcal isolation within a delta R cone of 0.3 with electron pt > 35 GeV | 1.5| 1.8| 1.1%|
| **Electron_dr03TkSumPt** | Float_t| Non-PF track isolation within a delta R cone of 0.3 with electron pt > 35 GeV | 1.2| 1.4| 0.9%|
| **Electron_dr03TkSumPtHEEP** | Float_t| Non-PF track isolation within a delta R cone of 0.3 with electron pt > 35 GeV used in HEEP ID | 1.1| 1.4| 0.9%|
| **Electron_dxy** | Float_t| dxy (with sign) wrt first PV, in cm | 2.5| 3.0| 2.0%|
| **Electron_dxyErr** | Float_t| dxy uncertainty, in cm | 1.7| 2.1| 1.3%|
| **Electron_dz** | Float_t| dz (with sign) wrt first PV, in cm | 2.5| 3.1| 2.0%|
| **Electron_dzErr** | Float_t| dz uncertainty, in cm | 1.7| 2.1| 1.3%|
| **Electron_eInvMinusPInv** | Float_t| 1/E_SC - 1/p_trk | 2.5| 3.0| 1.9%|
| **Electron_ecalEnergy** | Float_t| energy after ECAL-only regression applied | 2.3| 2.8| 1.8%|
| **Electron_ecalEnergyError** | Float_t| ecalEnergy error | 2.3| 2.8| 1.8%|
| **Electron_energyErr** | Float_t| energy error of the cluster-track combination | 1.8| 2.2| 1.4%|
| **Electron_eta** | Float_t| eta | 2.6| 3.2| 2.1%|
| **Electron_fbrem** | Float_t| Fraction of brem | 2.4| 2.8| 1.9%|
| **Electron_fsrPhotonIdx** | Short_t(index to Fsrphoton)| Index of the lowest-dR/ET2 among associated FSR photons | 0.6| 0.8| 0.5%|
| **Electron_gsfTrketaMode** | Float_t| GSF track etaMode | 2.3| 2.8| 1.8%|
| **Electron_gsfTrkpMode** | Float_t| GSF track pMode | 2.3| 2.8| 1.8%|
| **Electron_gsfTrkpModeErr** | Float_t| GSF track pMode error | 2.1| 2.5| 1.6%|
| **Electron_gsfTrkphiMode** | Float_t| GSF track phiMode | 2.3| 2.8| 1.8%|
| **Electron_hoe** | Float_t| H over E | 1.9| 2.3| 1.5%|
| **Electron_ip3d** | Float_t| 3D impact parameter wrt first PV, in cm | 2.4| 2.9| 1.9%|
| **Electron_ipLengthSig** | Float_t| significance of impact parameter | 2.1| 2.6| 1.7%|
| **Electron_isEB** | Bool_t| object in barrel if true derived from the seedCrystal and detID information | 0.7| 0.9| 0.6%|
| **Electron_isEcalDriven** | Bool_t| is ECAL driven if true | 0.7| 0.8| 0.5%|
| **Electron_isPFcand** | Bool_t| electron is PF candidate | 0.7| 0.9| 0.6%|
| **Electron_jetDF** | Float_t| value of the DEEPJET b tagging algorithm discriminator of the associated jet (0 if none) | 1.9| 2.3| 1.5%|
| **Electron_jetIdx** | Short_t(index to Jet)| index of the associated jet (-1 if none) | 0.9| 1.1| 0.7%|
| **Electron_jetNDauCharged** | UChar_t| number of charged daughters of the closest jet | 0.9| 1.1| 0.7%|
| **Electron_jetPtRelv2** | Float_t| Relative momentum of the lepton with respect to the closest jet after subtracting the lepton | 1.9| 2.3| 1.5%|
| **Electron_jetRelIso** | Float_t| Relative isolation in matched jet (1/ptRatio-1), -1 if none | 2.0| 2.4| 1.6%|
| **Electron_lostHits** | UChar_t| number of missing inner hits | 0.7| 0.9| 0.6%|
| **Electron_mass** | Float_t| mass | 1.7| 2.0| 1.3%|
| **Electron_miniPFRelIso_all** | Float_t| mini PF relative isolation, total (with scaled rho*EA PU Winter22V1 corrections) | 3.0| 3.6| 2.4%|
| **Electron_miniPFRelIso_chg** | Float_t| mini PF relative isolation, charged component | 2.6| 3.1| 2.0%|
| **Electron_mvaHZZIso** | Float_t| HZZ MVA Iso ID score | 2.7| 3.3| 2.1%|
| **Electron_mvaIso** | Float_t| MVA Iso ID score, Winter22V1 | 2.8| 3.4| 2.2%|
| **Electron_mvaIso_WP80** | Bool_t| MVA Iso ID WP80, Winter22V1 | 0.7| 0.8| 0.5%|
| **Electron_mvaIso_WP90** | Bool_t| MVA Iso ID WP90, Winter22V1 | 0.7| 0.8| 0.5%|
| **Electron_mvaIso_WPHZZ** | Bool_t| MVA Iso ID WPHZZ, Winter22V1 | 0.7| 0.8| 0.6%|
| **Electron_mvaNoIso** | Float_t| MVA noIso ID score, Winter22V1 | 3.0| 3.6| 2.4%|
| **Electron_mvaNoIso_WP80** | Bool_t| MVA noIso ID WP80, Winter22V1 | 0.7| 0.8| 0.5%|
| **Electron_mvaNoIso_WP90** | Bool_t| MVA noIso ID WP90, Winter22V1 | 0.7| 0.8| 0.6%|
| **Electron_pdgId** | Int_t| PDG code assigned by the event reconstruction (not by MC truth) | 0.8| 1.0| 0.6%|
| **Electron_pfRelIso03_all** | Float_t| PF relative isolation dR=0.3, total (with rho*EA PU Winter22V1 corrections) | 3.1| 3.8| 2.5%|
| **Electron_pfRelIso03_chg** | Float_t| PF relative isolation dR=0.3, charged component | 2.9| 3.5| 2.3%|
| **Electron_pfRelIso04_all** | Float_t| PF relative isolation dR=0.4, total (with rho*EA PU Winter22V1 corrections) | 2.2| 2.7| 1.7%|
| **Electron_phi** | Float_t| phi | 2.6| 3.2| 2.1%|
| **Electron_photonIdx** | Short_t(index to Photon)| index of the first associated photon (-1 if none) | 0.8| 1.0| 0.7%|
| **Electron_promptMVA** | Float_t| Prompt MVA lepton ID score. Corresponds to the previous mvaTTH | 2.3| 2.8| 1.8%|
| **Electron_pt** | Float_t| pt | 3.6| 4.3| 2.8%|
| **Electron_r9** | Float_t| R9 of the supercluster, calculated with full 5x5 region | 2.0| 2.4| 1.6%|
| **Electron_rawEnergy** | Float_t| raw energy of Supercluster | 2.3| 2.8| 1.8%|
| **Electron_scEtOverPt** | Float_t| (supercluster transverse energy)/pt-1 | 2.1| 2.5| 1.6%|
| **Electron_seedGain** | UChar_t| Gain of the seed crystal | 0.6| 0.7| 0.5%|
| **Electron_seediEtaOriX** | Short_t| iEta or iX of seed crystal. iEta is barrel-only, iX is endcap-only. iEta runs from -85 to +85, with no crystal at iEta=0. iX runs from 1 to 100. | 1.5| 1.9| 1.2%|
| **Electron_seediPhiOriY** | Short_t| iPhi or iY of seed crystal. iPhi is barrel-only, iY is endcap-only. iPhi runs from 1 to 360. iY runs from 1 to 100. | 1.6| 1.9| 1.3%|
| **Electron_sieie** | Float_t| sigma_IetaIeta of the supercluster, calculated with full 5x5 region | 2.1| 2.6| 1.7%|
| **Electron_sip3d** | Float_t| 3D impact parameter significance wrt first PV, in cm | 2.4| 2.8| 1.9%|
| **Electron_superclusterEta** | Float_t| supercluster eta | 2.3| 2.8| 1.8%|
| **Electron_svIdx** | Short_t(index to Sv)| index of matching secondary vertex | 0.7| 0.9| 0.6%|
| **Electron_tightCharge** | UChar_t| Tight charge criteria (0:none, 1:isGsfScPixChargeConsistent, 2:isGsfCtfScPixChargeConsistent) | 0.8| 0.9| 0.6%|
| **Electron_vidNestedWPBitmap** | Int_t| VID compressed bitmap (MinPtCut,GsfEleSCEtaMultiRangeCut,GsfEleEBEECut,GsfEleEBEECut,GsfEleEBEECut,GsfEleHadronicOverEMEnergyScaledCut,GsfEleEBEECut,GsfEleRelPFIsoScaledCut,GsfEleConversionVetoCut,GsfEleMissingHitsCut), 3 bits per cut | 1.8| 2.2| 1.4%|
| **Electron_vidNestedWPBitmapHEEP** | Int_t| VID compressed bitmap (MinPtCut,GsfEleSCEtaMultiRangeCut,GsfEleEBEECut,GsfEleEBEECut,GsfEleFull5x5SigmaIEtaIEtaWithSatCut,GsfEleFull5x5E2x5OverE5x5WithSatCut,GsfEleHadronicOverEMLinearCut,GsfEleTrkPtIsoCut,GsfEleEmHadD1IsoRhoCut,GsfEleDxyCut,GsfEleMissingHitsCut,GsfEleEcalDrivenCut), 1 bits per cut | 1.6| 2.0| 1.3%|
| **nElectron** | Int_t| slimmedElectrons after basic selection (pt > 5 ) | 0.3| 0.4| 0.3%|

### FatJet
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **FatJet_area** | Float_t| jet catchment area, for JECs | 0.4| 2.5| 1.0%|
| **FatJet_chEmEF** | Float_t| charged Electromagnetic Energy Fraction | 0.4| 2.3| 0.9%|
| **FatJet_chHEF** | Float_t| charged Hadron Energy Fraction | 0.6| 3.7| 1.4%|
| **FatJet_chMultiplicity** | Short_t| (Puppi-weighted) Number of charged particles in the jet | 0.4| 2.4| 0.9%|
| **FatJet_electronIdx3SJ** | Short_t(index to Electron)| index of electron matched to jet | 0.3| 1.8| 0.7%|
| **FatJet_eta** | Float_t| eta | 0.7| 4.3| 1.6%|
| **FatJet_globalParT3_QCD** | Float_t| Mass-decorrelated GlobalParT-3 QCD score. | 0.6| 3.7| 1.4%|
| **FatJet_globalParT3_TopbWev** | Float_t| Mass-decorrelated GlobalParT-3 Top->bWev score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_TopbWmv** | Float_t| Mass-decorrelated GlobalParT-3 Top->bWmv score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_TopbWq** | Float_t| Mass-decorrelated GlobalParT-3 Top->bWq score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_TopbWqq** | Float_t| Mass-decorrelated GlobalParT-3 Top->bWqq score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_TopbWtauhv** | Float_t| Mass-decorrelated GlobalParT-3 Top->bWtauhv score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_WvsQCD** | Float_t| Mass-decorrelated GlobalParT-3 (Xqq+Xcs/Xqq+Xcs+QCD) binarized score. | 0.6| 3.8| 1.5%|
| **FatJet_globalParT3_XWW3q** | Float_t| Mass-decorrelated GlobalParT-3 X->WW3q score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_XWW4q** | Float_t| Mass-decorrelated GlobalParT-3 X->WW4q score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_XWWqqev** | Float_t| Mass-decorrelated GlobalParT-3 X->WWqqev score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_XWWqqmv** | Float_t| Mass-decorrelated GlobalParT-3 X->WWqqmv score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_Xbb** | Float_t| Mass-decorrelated GlobalParT-3 X->bb score. Note: For sig vs bkg (e.g. bkg=QCD) tagging, use sig/(sig+bkg) to construct the discriminator | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_Xcc** | Float_t| Mass-decorrelated GlobalParT-3 X->cc score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_Xcs** | Float_t| Mass-decorrelated GlobalParT-3 X->cs score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_Xqq** | Float_t| Mass-decorrelated GlobalParT-3 X->qq (ss/dd/uu) score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_Xtauhtaue** | Float_t| Mass-decorrelated GlobalParT-3 X->tauhtaue score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_Xtauhtauh** | Float_t| Mass-decorrelated GlobalParT-3 X->tauhtauh score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_Xtauhtaum** | Float_t| Mass-decorrelated GlobalParT-3 X->tauhtaum score | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_massCorrGeneric** | Float_t| GlobalParT-3 mass regression corrector with respect to the original jet mass, optimised for generic jet cases. Use (massCorrGeneric * mass * (1 - rawFactor)) to get the regressed mass | 0.6| 3.7| 1.4%|
| **FatJet_globalParT3_massCorrX2p** | Float_t| GlobalParT-3 mass regression corrector with respect to the original jet mass, optimised for resonance 2-prong (bb/cc/cs/ss/qq) jets. Use (massCorrX2p * mass * (1 - rawFactor)) to get the regressed mass | 0.6| 3.6| 1.4%|
| **FatJet_globalParT3_withMassTopvsQCD** | Float_t| GlobalParT-3 tagger (w/mass) Top vs QCD discriminator | 0.6| 4.0| 1.5%|
| **FatJet_globalParT3_withMassWvsQCD** | Float_t| GlobalParT-3 tagger (w/mass) W vs QCD discriminator | 0.6| 3.9| 1.5%|
| **FatJet_globalParT3_withMassZvsQCD** | Float_t| GlobalParT-3 tagger (w/mass) Z vs QCD discriminator | 0.6| 3.9| 1.5%|
| **FatJet_hfEmEF** | Float_t| electromagnetic Energy Fraction in HF | 0.2| 1.5| 0.6%|
| **FatJet_hfHEF** | Float_t| hadronic Energy Fraction in HF | 0.3| 1.6| 0.6%|
| **FatJet_lsf3** | Float_t| Lepton Subjet Fraction (3 subjets) | 0.5| 3.1| 1.2%|
| **FatJet_mass** | Float_t| mass | 0.6| 3.6| 1.4%|
| **FatJet_msoftdrop** | Float_t| Corrected soft drop mass with PUPPI | 0.6| 3.9| 1.5%|
| **FatJet_muEF** | Float_t| muon Energy Fraction | 0.3| 1.9| 0.7%|
| **FatJet_muonIdx3SJ** | Short_t(index to Muon)| index of muon matched to jet | 0.3| 1.6| 0.6%|
| **FatJet_n2b1** | Float_t| N2 with beta=1 (for jets with raw pT>250 GeV) | 0.5| 3.3| 1.3%|
| **FatJet_n3b1** | Float_t| N3 with beta=1 (for jets with raw pT>250 GeV) | 0.3| 2.2| 0.9%|
| **FatJet_nConstituents** | UChar_t| Number of particles in the jet | 0.4| 2.3| 0.9%|
| **FatJet_neEmEF** | Float_t| neutral Electromagnetic Energy Fraction | 0.6| 3.7| 1.4%|
| **FatJet_neHEF** | Float_t| neutral Hadron Energy Fraction | 0.6| 3.7| 1.4%|
| **FatJet_neMultiplicity** | Short_t| (Puppi-weighted) Number of neutral particles in the jet | 0.4| 2.3| 0.9%|
| **FatJet_particleNetLegacy_QCD** | Float_t| Mass-decorrelated ParticleNet Legacy Run-2 tagger raw QCD score | 0.6| 3.6| 1.4%|
| **FatJet_particleNetLegacy_Xbb** | Float_t| Mass-decorrelated ParticleNet Legacy Run-2 tagger raw X->bb score. For X->bb vs QCD tagging, use Xbb/(Xbb+QCD) | 0.6| 3.9| 1.5%|
| **FatJet_particleNetLegacy_Xcc** | Float_t| Mass-decorrelated ParticleNet Legacy Run-2 tagger raw X->cc score. For X->cc vs QCD tagging, use Xcc/(Xcc+QCD) | 0.6| 3.8| 1.5%|
| **FatJet_particleNetLegacy_Xqq** | Float_t| Mass-decorrelated ParticleNet Legacy Run-2 tagger raw X->qq (uds) score. For X->qq vs QCD tagging, use Xqq/(Xqq+QCD). For W vs QCD tagging, use (Xcc+Xqq)/(Xcc+Xqq+QCD) | 0.6| 3.8| 1.5%|
| **FatJet_particleNetLegacy_mass** | Float_t| ParticleNet Legacy Run-2 mass regression | 0.6| 3.7| 1.4%|
| **FatJet_particleNetWithMass_H4qvsQCD** | Float_t| ParticleNet tagger (w/ mass) H(->VV->qqqq) vs QCD discriminator | 0.6| 4.0| 1.5%|
| **FatJet_particleNetWithMass_HbbvsQCD** | Float_t| ParticleNet tagger (w/mass) H(->bb) vs QCD discriminator | 0.6| 3.9| 1.5%|
| **FatJet_particleNetWithMass_HccvsQCD** | Float_t| ParticleNet tagger (w/mass) H(->cc) vs QCD discriminator | 0.6| 3.9| 1.5%|
| **FatJet_particleNetWithMass_QCD** | Float_t| ParticleNet tagger (w/ mass) QCD(bb,cc,b,c,others) sum | 0.5| 3.5| 1.4%|
| **FatJet_particleNetWithMass_TvsQCD** | Float_t| ParticleNet tagger (w/ mass) top vs QCD discriminator | 0.6| 4.0| 1.5%|
| **FatJet_particleNetWithMass_WvsQCD** | Float_t| ParticleNet tagger (w/ mass) W vs QCD discriminator | 0.6| 3.9| 1.5%|
| **FatJet_particleNetWithMass_ZvsQCD** | Float_t| ParticleNet tagger (w/ mass) Z vs QCD discriminator | 0.6| 3.9| 1.5%|
| **FatJet_particleNet_QCD** | Float_t| ParticleNet tagger QCD(0+1+2HF) sum | 0.5| 3.2| 1.2%|
| **FatJet_particleNet_QCD0HF** | Float_t| ParticleNet tagger QCD 0 HF (b/c) score | 0.5| 3.2| 1.3%|
| **FatJet_particleNet_QCD1HF** | Float_t| ParticleNet tagger QCD 1 HF (b/c) score | 0.5| 3.2| 1.2%|
| **FatJet_particleNet_QCD2HF** | Float_t| ParticleNet tagger QCD 2 HF (b/c) score | 0.5| 3.2| 1.3%|
| **FatJet_particleNet_WVsQCD** | Float_t| ParticleNet W->qq vs. QCD score: Xqq+Xcc/(Xqq+Xcc+QCD) | 0.5| 3.2| 1.2%|
| **FatJet_particleNet_XbbVsQCD** | Float_t| ParticleNet X->bb vs. QCD score: Xbb/(Xbb+QCD) | 0.5| 3.3| 1.3%|
| **FatJet_particleNet_XccVsQCD** | Float_t| ParticleNet X->cc vs. QCD score: Xcc/(Xcc+QCD) | 0.5| 3.3| 1.3%|
| **FatJet_particleNet_XggVsQCD** | Float_t| ParticleNet X->gg vs. QCD score: Xgg/(Xgg+QCD) | 0.5| 3.3| 1.3%|
| **FatJet_particleNet_XqqVsQCD** | Float_t| ParticleNet X->qq (uds) vs. QCD score: Xqq/(Xqq+QCD) | 0.5| 3.3| 1.3%|
| **FatJet_particleNet_XteVsQCD** | Float_t| ParticleNet X->e tau_h vs. QCD score: Xte/(Xte+QCD) | 0.5| 3.3| 1.3%|
| **FatJet_particleNet_XtmVsQCD** | Float_t| ParticleNet X->mu tau_h vs. QCD score: Xtm/(Xtm+QCD) | 0.5| 3.3| 1.3%|
| **FatJet_particleNet_XttVsQCD** | Float_t| ParticleNet X->tau_h tau_h vs. QCD score: Xtt/(Xtt+QCD) | 0.5| 3.3| 1.3%|
| **FatJet_particleNet_massCorr** | Float_t| ParticleNet mass regression, relative correction to JEC-corrected jet mass (no softdrop) | 0.5| 3.0| 1.2%|
| **FatJet_phi** | Float_t| phi | 0.7| 4.2| 1.6%|
| **FatJet_pt** | Float_t| pt | 0.5| 3.4| 1.3%|
| **FatJet_rawFactor** | Float_t| 1 - Factor to get back to raw pT | 0.4| 2.7| 1.0%|
| **FatJet_subJetIdx1** | Short_t(index to Subjet)| index of first subjet | 0.3| 1.9| 0.7%|
| **FatJet_subJetIdx2** | Short_t(index to Subjet)| index of second subjet | 0.3| 1.9| 0.7%|
| **FatJet_tau1** | Float_t| Nsubjettiness (1 axis) | 0.6| 3.7| 1.4%|
| **FatJet_tau2** | Float_t| Nsubjettiness (2 axis) | 0.6| 3.7| 1.4%|
| **FatJet_tau3** | Float_t| Nsubjettiness (3 axis) | 0.6| 3.7| 1.4%|
| **FatJet_tau4** | Float_t| Nsubjettiness (4 axis) | 0.6| 3.7| 1.4%|
| **nFatJet** | Int_t| slimmedJetsAK8, i.e. ak8 fat jets for boosted analysis | 0.2| 1.1| 0.4%|

### FatJetPFCand
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **FatJetPFCand_jetIdx** | Int_t(index to Jet)| Index of the parent jet | 0.5| 0.1| 12.9%|
| **FatJetPFCand_pfCandIdx** | Int_t(index to Pfcand)| Index in the PFCand table | 3.2| 0.8| 81.0%|
| **nFatJetPFCand** | Int_t|  | 0.2| 0.1| 6.1%|

### Flag
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Flag_BadChargedCandidateFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.3%|
| **Flag_BadChargedCandidateFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|
| **Flag_BadChargedCandidateSummer16Filter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.3%|
| **Flag_BadChargedCandidateSummer16Filter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|
| **Flag_BadPFMuonDzFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_BadPFMuonDzFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|
| **Flag_BadPFMuonFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_BadPFMuonFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.2%|
| **Flag_BadPFMuonSummer16Filter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_BadPFMuonSummer16Filter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|
| **Flag_CSCTightHalo2015Filter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 3.6%|
| **Flag_CSCTightHalo2015Filter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 3.6%|
| **Flag_CSCTightHaloFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 2.7%|
| **Flag_CSCTightHaloFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 2.8%|
| **Flag_CSCTightHaloTrkMuUnvetoFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 5.4%|
| **Flag_CSCTightHaloTrkMuUnvetoFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 5.4%|
| **Flag_EcalDeadCellBoundaryEnergyFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 2.3%|
| **Flag_EcalDeadCellBoundaryEnergyFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 2.3%|
| **Flag_EcalDeadCellTriggerPrimitiveFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.3%|
| **Flag_EcalDeadCellTriggerPrimitiveFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|
| **Flag_HBHENoiseFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_HBHENoiseFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.2%|
| **Flag_HBHENoiseIsoFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_HBHENoiseIsoFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.2%|
| **Flag_HcalStripHaloFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_HcalStripHaloFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|
| **Flag_METFilters** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.5%|
| **Flag_chargedHadronTrackResolutionFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.3%|
| **Flag_chargedHadronTrackResolutionFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|
| **Flag_ecalBadCalibFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_ecalBadCalibFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|
| **Flag_ecalLaserCorrFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 6.3%|
| **Flag_ecalLaserCorrFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 6.3%|
| **Flag_eeBadScFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_eeBadScFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.2%|
| **Flag_globalSuperTightHalo2016Filter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.4%|
| **Flag_globalSuperTightHalo2016Filter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.4%|
| **Flag_globalTightHalo2016Filter** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 2.3%|
| **Flag_globalTightHalo2016Filter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 2.3%|
| **Flag_goodVertices** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_goodVertices_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.2%|
| **Flag_hcalLaserEventFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_hcalLaserEventFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|
| **Flag_hfNoisyHitsFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.4%|
| **Flag_hfNoisyHitsFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.4%|
| **Flag_muonBadTrackFilter** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_muonBadTrackFilter_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|
| **Flag_trkPOGFilters** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_trkPOGFilters_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.2%|
| **Flag_trkPOG_logErrorTooManyClusters** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.3%|
| **Flag_trkPOG_logErrorTooManyClusters_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|
| **Flag_trkPOG_manystripclus53X** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.2%|
| **Flag_trkPOG_manystripclus53X_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|
| **Flag_trkPOG_toomanystripclus53X** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 1.3%|
| **Flag_trkPOG_toomanystripclus53X_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 1.3%|

### FsrPhoton
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **FsrPhoton_dROverEt2** | Float_t| deltaR to associated muon divided by photon et2 | 0.3| 7.8| 16.7%|
| **FsrPhoton_electronIdx** | Short_t(index to Electron)| index of associated electron | 0.2| 4.3| 9.1%|
| **FsrPhoton_eta** | Float_t| eta | 0.3| 6.9| 14.6%|
| **FsrPhoton_muonIdx** | Short_t(index to Muon)| index of associated muon | 0.2| 4.2| 8.9%|
| **FsrPhoton_phi** | Float_t| phi | 0.3| 6.9| 14.7%|
| **FsrPhoton_pt** | Float_t| pt | 0.3| 6.4| 13.7%|
| **FsrPhoton_relIso03** | Float_t| relative isolation in a 0.3 cone without CHS | 0.3| 7.6| 16.2%|
| **nFsrPhoton** | Int_t| Final state radiation photons emitted by muons or electrons | 0.1| 2.8| 6.1%|

### HLT
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **HLT_AK8DiPFJet250_250_SoftDropMass40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8DiPFJet250_250_SoftDropMass50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8DiPFJet260_260_SoftDropMass30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8DiPFJet260_260_SoftDropMass40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8DiPFJet270_270_SoftDropMass30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8DiPFJet280_280_SoftDropMass30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8DiPFJet290_290_SoftDropMass30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet140** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet200** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet220_SoftDropMass40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet220_SoftDropMass40_PNetBB0p06_DoubleAK4PFJet60_30_PNet2BTagMean0p50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_AK8PFJet220_SoftDropMass40_PNetBB0p06_DoubleAK4PFJet60_30_PNet2BTagMean0p53** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_AK8PFJet220_SoftDropMass40_PNetBB0p06_DoubleAK4PFJet60_30_PNet2BTagMean0p55** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_AK8PFJet220_SoftDropMass40_PNetBB0p06_DoubleAK4PFJet60_30_PNet2BTagMean0p60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet230_SoftDropMass40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet230_SoftDropMass40_PNetBB0p06** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet230_SoftDropMass40_PNetBB0p10** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet230_SoftDropMass40_PNetTauTau0p03** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet230_SoftDropMass40_PNetTauTau0p05** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet250_SoftDropMass40_PNetBB0p06** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet250_SoftDropMass40_PNetBB0p10** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet250_SoftDropMass40_PNetTauTau0p03** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet250_SoftDropMass40_PNetTauTau0p05** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet260** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet275_Nch40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet275_Nch45** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet275_SoftDropMass40_PNetBB0p06** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet275_SoftDropMass40_PNetBB0p10** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet275_SoftDropMass40_PNetTauTau0p03** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet275_SoftDropMass40_PNetTauTau0p05** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet320** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet380_SoftDropMass30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_AK8PFJet40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet400** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet400_SoftDropMass30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet425_SoftDropMass30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet450** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet450_SoftDropMass30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet500** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_AK8PFJet550** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet60** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJet80** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJetFwd140** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJetFwd200** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJetFwd260** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJetFwd320** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJetFwd40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJetFwd400** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJetFwd450** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJetFwd500** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJetFwd60** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_AK8PFJetFwd80** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_BTagMu_AK4DiJet110_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_BTagMu_AK4DiJet170_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_BTagMu_AK4DiJet20_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_BTagMu_AK4DiJet40_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_BTagMu_AK4DiJet70_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_BTagMu_AK4Jet300_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_BTagMu_AK8DiJet170_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_BTagMu_AK8Jet170_DoubleMu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_BTagMu_AK8Jet300_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CDC_L2cosmic_10_er1p0** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CDC_L2cosmic_5p5_er1p0** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CaloJet500_NoJetID** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_CaloJet550_NoJetID** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CaloMET350_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CaloMET60_DTCluster50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CaloMET60_DTClusterNoMB1S50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CaloMET90_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CaloMHT90** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CascadeMu100** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CscCluster100_Ele5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CscCluster100_Mu5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CscCluster100_PNetTauhPFJet10_Loose** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CscCluster50_Photon20Unseeded** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CscCluster50_Photon30Unseeded** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CscCluster_Loose** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CscCluster_Medium** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_CscCluster_Tight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiEle27_WPTightCaloOnly_L1DoubleEG** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.3%|
| **HLT_DiMu4_Ele9_CaloIdL_TrackIdL_DZ_Mass3p8** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiMu9_Ele9_CaloIdL_TrackIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiMu9_Ele9_CaloIdL_TrackIdL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve100_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve140** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve160_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve180_PPSMatch_Xi0p3_QuadJet_Max2ProtPerRP** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve200** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve220_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve260** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve260_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve300_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve320** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve400** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve500** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve60** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve60_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve80** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPFJetAve80_HFJEC** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPhoton10Time1ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DiPhoton10Time1p2ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPhoton10Time1p4ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPhoton10Time1p6ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPhoton10Time1p8ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPhoton10Time2ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiPhoton10_CaloIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DiSC30_18_EIso_AND_HE_Mass70** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_Jpsi** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_Jpsi3p5_Muon2** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_Jpsi_L1_4R_0er1p5R** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_Jpsi_L1_NoOS** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_Jpsi_NoVertexing** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_Jpsi_NoVertexing_L1_4R_0er1p5R** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_Jpsi_NoVertexing_NoOS** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_LowMass** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_LowMass_L1_0er1p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_LowMass_L1_4** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_LowMass_L1_TM530** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_Upsilon_L1_4p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_Upsilon_L1_4p5er2p0** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_Upsilon_L1_4p5er2p0M** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_Upsilon_Muon_NoL1Mass** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon0_Upsilon_NoVertexing** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon10_Upsilon_y1p4** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon12_Upsilon_y1p4** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon14_Phi_Barrel_Seagulls** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon14_PsiPrime** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon14_PsiPrime_noCorrL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon18_PsiPrime** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon18_PsiPrime_noCorrL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon24_Phi_noCorrL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon24_Upsilon_noCorrL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon25_Jpsi** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Dimuon25_Jpsi_noCorrL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Diphoton20_14_eta1p5_R9IdL_AND_HET_AND_IsoTCaloIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Diphoton20_14_eta1p5_R9IdL_AND_HE_AND_IsoTCaloIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Diphoton22_14_eta1p5_R9IdL_AND_HET_AND_IsoTCaloIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Diphoton22_14_eta1p5_R9IdL_AND_HE_AND_IsoTCaloIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Diphoton24_14_eta1p5_R9IdL_AND_HET_AND_IsoTCaloIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Diphoton24_16_eta1p5_R9IdL_AND_HET_AND_IsoTCaloIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Diphoton30_18_R9IdL_AND_HE_AND_IsoCaloId** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.3%|
| **HLT_Diphoton30_18_R9IdL_AND_HE_AND_IsoCaloId_Mass55** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.3%|
| **HLT_Diphoton30_22_R9Id_OR_IsoCaloId_AND_HE_R9Id_Mass90** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.4%|
| **HLT_Diphoton30_22_R9Id_OR_IsoCaloId_AND_HE_R9Id_Mass95** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.3%|
| **HLT_DiphotonMVA14p25_Mass90** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.3%|
| **HLT_DiphotonMVA14p25_Tight_Mass90** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DisplacedMu24_MediumChargedIsoDisplacedPFTauHPS24** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleCscCluster100** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleCscCluster75** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleEle10_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleEle24_eta2p1_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleEle25_CaloIdL_MW** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleEle27_CaloIdL_MW** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleEle33_CaloIdL_MW** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleEle6p5_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.3%|
| **HLT_DoubleEle8_CaloIdM_TrackIdM_Mass8_DZ_PFHT350** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleEle8_CaloIdM_TrackIdM_Mass8_PFHT350** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleEle8_eta1p22_mMax6** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.3%|
| **HLT_DoubleIsoMu20_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu10NoVtx_2Cha_CosmicSeed_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu10NoVtx_2Cha_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu12NoVtx_2Cha_CosmicSeed_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu12NoVtx_2Cha_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu14NoVtx_2Cha_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu23NoVtx_2Cha** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu23NoVtx_2Cha_CosmicSeed** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu25NoVtx_2Cha** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu25NoVtx_2Cha_CosmicSeed** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu25NoVtx_2Cha_CosmicSeed_Eta2p4** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu25NoVtx_2Cha_Eta2p4** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu30NoVtx_2Cha_CosmicSeed_Eta2p4** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu30NoVtx_2Cha_Eta2p4** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu_L3Mu16NoVtx_VetoL3Mu0DxyMax0p1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL2Mu_L3Mu18NoVtx_VetoL3Mu0DxyMax0p1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL3Mu16_10NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL3Mu18_10NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL3Mu20_10NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleL3dTksMu16_10NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMediumChargedIsoDisplacedPFTauHPS32_Trk1_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMediumChargedIsoDisplacedPFTauHPS32_Trk1_eta2p1_noDxy** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMediumChargedIsoDisplacedPFTauHPS36_Trk1_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMediumDeepTauPFTauHPS30_L2NN_eta2p1_OneProng** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleMediumDeepTauPFTauHPS30_L2NN_eta2p1_PFJet60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMediumDeepTauPFTauHPS30_L2NN_eta2p1_PFJet75** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoubleMediumDeepTauPFTauHPS35_L2NN_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoubleMu2_Jpsi_DoubleTrk1_Phi1p05** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu2_Jpsi_LowPt** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu3_DCA_PFMET50_PFMHT60** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu3_DCA_PFMET50_PFMHT60_Mass2p0** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu3_DCA_PFMET50_PFMHT60_Mass2p0_noDCA** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu3_DZ_PFMET50_PFMHT60** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu3_DZ_PFMET70_PFMHT70** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu3_DZ_PFMET90_PFMHT90** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu3_DoubleEle7p5_CaloIdL_TrackIdL_Upsilon** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu3_TkMu_DsTau3Mu** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu3_Trk_Tau3mu** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu3_Trk_Tau3mu_NoL1Mass** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu43NoFiltersNoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu48NoFiltersNoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_3_Bs** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_3_Displaced_Photon4_BsToMMG** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_3_Jpsi** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_3_LowMass** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_3_LowMass_SS** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_3_Photon4_BsToMMG** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_JpsiTrkTrk_Displaced** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_JpsiTrk_Bc** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_Jpsi_Displaced** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_Jpsi_NoVertexing** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_LowMass_Displaced** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_Mass3p8_DZ_PFHT350** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu4_MuMuTrk_Displaced** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoubleMu5_Upsilon_DoubleEle3_CaloIdL_TrackIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoublePFJets100_PNetBTag_0p11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoublePFJets116MaxDeta1p6_PNet2BTag_0p11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoublePFJets128MaxDeta1p6_PNet2BTag_0p11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoublePFJets200_PNetBTag_0p11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoublePFJets350_PNetBTag_0p11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoublePFJets40_PNetBTag_0p11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoublePNetTauhPFJet26_L2NN_eta2p3_PFJet60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_DoublePNetTauhPFJet26_L2NN_eta2p3_PFJet75** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoublePNetTauhPFJet30_Medium_L2NN_eta2p3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoublePNetTauhPFJet30_Tight_L2NN_eta2p3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoublePhoton33_CaloIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_DoublePhoton70** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_DoublePhoton85** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_ECALHT800** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_EcalCalibration** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Ele115_CaloIdVT_GsfTrkIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele12_CaloIdL_TrackIdL_IsoVL_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele135_CaloIdVT_GsfTrkIdT** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele14_eta2p5_IsoVVVL_Gsf_PFHT200_PNetBTag0p53** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele15_IsoVVVL_PFHT450** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele15_IsoVVVL_PFHT450_PFMET50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele15_IsoVVVL_PFHT600** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Ele16_Ele12_Ele8_CaloIdL_TrackIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Ele17_CaloIdM_TrackIdM_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele23_CaloIdL_TrackIdL_IsoVL_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Ele23_CaloIdM_TrackIdM_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Ele23_Ele12_CaloIdL_TrackIdL_IsoVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.3%|
| **HLT_Ele23_Ele12_CaloIdL_TrackIdL_IsoVL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele24_eta2p1_WPTight_Gsf_LooseDeepTauPFTauHPS30_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele24_eta2p1_WPTight_Gsf_PNetTauhPFJet30_Loose_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele24_eta2p1_WPTight_Gsf_PNetTauhPFJet30_Medium_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele24_eta2p1_WPTight_Gsf_PNetTauhPFJet30_Tight_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele28_HighEta_SC20_Mass55** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele28_eta2p1_WPTight_Gsf_HT150** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Ele30_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.5%|
| **HLT_Ele30_eta2p1_WPTight_Gsf_CentralPFJet35_EleCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Ele32_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.5%|
| **HLT_Ele32_WPTight_Gsf_L1DoubleEG** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.5%|
| **HLT_Ele35_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.5%|
| **HLT_Ele38_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.4%|
| **HLT_Ele40_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.4%|
| **HLT_Ele50_CaloIdVT_GsfTrkIdT_AK8PFJet220_SoftDropMass40** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele50_CaloIdVT_GsfTrkIdT_AK8PFJet220_SoftDropMass40_PNetBB0p06** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Ele50_CaloIdVT_GsfTrkIdT_AK8PFJet230_SoftDropMass40** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele50_CaloIdVT_GsfTrkIdT_AK8PFJet230_SoftDropMass40_PNetBB0p06** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Ele50_CaloIdVT_GsfTrkIdT_AK8PFJet230_SoftDropMass40_PNetBB0p10** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Ele50_CaloIdVT_GsfTrkIdT_PFJet165** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele50_IsoVVVL_PFHT450** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Ele8_CaloIdL_TrackIdL_IsoVL_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Ele8_CaloIdM_TrackIdM_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_EphemeralPhysics** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_EphemeralZeroBias** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT170_L1SingleLLPJet_DisplacedDijet40_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DelayedJet40_DoubleDelay0p5nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DelayedJet40_DoubleDelay1nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DelayedJet40_SingleDelay1nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DelayedJet40_SingleDelay2nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DisplacedDijet40_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DisplacedDijet40_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT200_L1SingleLLPJet_DisplacedDijet60_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT200_L1SingleLLPJet_PFJet60_NeutralHadronFrac0p7** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT200_L1SingleLLPJet_PFJet60_NeutralHadronFrac0p8** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT240_L1SingleLLPJet_DisplacedDijet40_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT270_L1SingleLLPJet_DisplacedDijet40_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT280_L1SingleLLPJet_DisplacedDijet40_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT300_Beamspot** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT320_L1SingleLLPJet_DisplacedDijet60_Inclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT350** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT350_DelayedJet40_SingleDelay1p5To3p5nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT350_DelayedJet40_SingleDelay1p6To3p5nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT350_DelayedJet40_SingleDelay1p75To3p5nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT350_DelayedJet40_SingleDelay3nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT350_DelayedJet40_SingleDelay3p25nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT350_DelayedJet40_SingleDelay3p5nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT360_DisplacedDijet40_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT360_DisplacedDijet45_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_HT390_DisplacedDijet40_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_HT390_DisplacedDijet45_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT390eta2p0_DisplacedDijet40_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_HT400_DisplacedDijet40_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT420_L1SingleLLPJet_DisplacedDijet60_Inclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT425** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_DoubleDelay0p5nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_DoubleDelay0p5nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_DoubleDelay0p75nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_DoubleDelay1nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_DoubleDelay1nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_DoubleDelay1p25nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_DoubleDelay1p5nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay0p5nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay0p5nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay1To1p5nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay1nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay1nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay1p1To1p6nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay1p25To1p75nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay1p25nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay1p5nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay1p5nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay2nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay2p25nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DelayedJet40_SingleDelay2p5nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DisplacedDijet40_DisplacedTrack** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT430_DisplacedDijet40_Inclusive1PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_HT550_DisplacedDijet60_Inclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HT650_DisplacedDijet60_Inclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HcalCalibration** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HcalNZS** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HcalPhiSym** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_HighPtTkMu100** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu20** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu20_eta2p1_LooseDeepTauPFTauHPS27_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu20_eta2p1_PNetTauhPFJet27_Loose_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu20_eta2p1_PNetTauhPFJet27_Medium_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu20_eta2p1_PNetTauhPFJet27_Tight_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_OneProng32** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_TwoProngs35** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_LooseDeepTauPFTauHPS180_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_LooseDeepTauPFTauHPS30_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS20_eta2p1_SingleL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS30_L2NN_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS30_L2NN_eta2p1_OneProng_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS30_L2NN_eta2p1_PFJet60_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS30_L2NN_eta2p1_PFJet75_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS35_L2NN_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_MediumDeepTauPFTauHPS45_L2NN_eta2p1_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PFHT250** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PFHT250_QuadPFJet25** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PFHT250_QuadPFJet25_PNet1Tauh0p50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet130_Loose_L2NN_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet130_Medium_L2NN_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet130_Tight_L2NN_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet20_eta2p2_SingleL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet26_L2NN_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet26_L2NN_eta2p3_CrossL1_PFJet60** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet26_L2NN_eta2p3_CrossL1_PFJet75** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet30_Loose_eta2p3_CrossL1_ETau_Monitoring** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet30_Medium_L2NN_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet30_Medium_eta2p3_CrossL1_ETau_Monitoring** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet30_Tight_L2NN_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet30_Tight_eta2p3_CrossL1_ETau_Monitoring** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_PNetTauhPFJet45_L2NN_eta2p3_CrossL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu24_eta2p1_SinglePFJet25_PNet1Tauh0p50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu27** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu27_MediumChargedIsoDisplacedPFTauHPS24_eta2p1_SingleL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu50_AK8PFJet220_SoftDropMass40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu50_AK8PFJet220_SoftDropMass40_PNetBB0p06** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu50_AK8PFJet230_SoftDropMass40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu50_AK8PFJet230_SoftDropMass40_PNetBB0p06** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoMu50_AK8PFJet230_SoftDropMass40_PNetBB0p10** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoTrackHB** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoTrackHE** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoTrk200_L1SingleMuShower** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_IsoTrk400_L1SingleMuShower** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1AXOVTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1CSCShower_DTCluster50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1CSCShower_DTCluster75** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1ETMHadSeeds** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1MET_DTCluster50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1MET_DTClusterNoMB1S50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Mu6HT240** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1SingleLLPJet** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1SingleMuCosmics** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_DoubleDelay0p5nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_DoubleDelay0p75nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_DoubleDelay1nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_DoubleDelay1p25nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_DoubleDelay1p25nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_DoubleDelay1p5nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_DoubleDelay1p5nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_DoubleDelay1p75nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_SingleDelay2p5To4nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_SingleDelay2p5nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_SingleDelay2p6To4nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_SingleDelay2p75To4nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_SingleDelay2p75nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_SingleDelay3nsTrackless** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_SingleDelay3p5nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_SingleDelay3p75nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1Tau_DelayedJet40_SingleDelay4nsInclusive** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L1_CDC_SingleMu_3_er1p2_TOP120_DPHI2p618_3p142** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L2Mu10NoVtx_2Cha** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L2Mu10NoVtx_2Cha_CosmicSeed** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L2Mu10NoVtx_2Cha_CosmicSeed_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L2Mu10NoVtx_2Cha_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L2Mu10_NoVertex_NoBPTX** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L2Mu10_NoVertex_NoBPTX3BX** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L2Mu23NoVtx_2Cha** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L2Mu23NoVtx_2Cha_CosmicSeed** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L2Mu40_NoVertex_3Sta_NoBPTX3BX** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L2Mu45_NoVertex_3Sta_NoBPTX3BX** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L2Mu50NoVtx_3Cha_CosmicSeed_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L2Mu50NoVtx_3Cha_VetoL3Mu0DxyMax1cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L3Mu10NoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L3Mu10NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L3Mu30NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L3Mu50NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_L3dTksMu10_NoVtx_DxyMin0p01cm** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_LooseDeepTauPFTauHPS180_L2NN_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_MET105_IsoTrk50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_MET120_IsoTrk50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu0_Barrel** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu0_Barrel_L1HP10** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu0_Barrel_L1HP11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu0_Barrel_L1HP6** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu0_Barrel_L1HP6_IP6** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu0_Barrel_L1HP7** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu0_Barrel_L1HP8** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu0_Barrel_L1HP9** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu0_L1DoubleMu** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu10_Barrel_L1HP11_IP6** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu12_DoublePFJets100_PNetBTag_0p11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu12_DoublePFJets200_PNetBTag_0p11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu12_DoublePFJets350_PNetBTag_0p11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu12_DoublePFJets40MaxDeta1p6_PNet2BTag_0p11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu12_DoublePFJets40_PNetBTag_0p11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu12_DoublePFJets54MaxDeta1p6_PNet2BTag_0p11** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu12_IsoVVL_PFHT150_PNetBTag0p53** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu12_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu12_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu12eta2p3** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu12eta2p3_PFJet40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu15** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu15_IsoVVVL_PFHT450** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu15_IsoVVVL_PFHT450_PFMET50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu15_IsoVVVL_PFHT600** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu17** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu17_Photon30_IsoCaloId** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu17_TrkIsoVVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu17_TrkIsoVVL_Mu8_TrkIsoVVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu17_TrkIsoVVL_Mu8_TrkIsoVVL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu17_TrkIsoVVL_Mu8_TrkIsoVVL_DZ_Mass3p8** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu17_TrkIsoVVL_Mu8_TrkIsoVVL_DZ_Mass8** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu17_TrkIsoVVL_Mu8_TrkIsoVVL_DZ_Mass8_AK8CaloJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu17_TrkIsoVVL_Mu8_TrkIsoVVL_DZ_Mass8_AK8PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu17_TrkIsoVVL_Mu8_TrkIsoVVL_DZ_Mass8_CaloJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu17_TrkIsoVVL_Mu8_TrkIsoVVL_DZ_Mass8_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu18_Mu9_SameSign** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu19** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu19_TrkIsoVVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu19_TrkIsoVVL_Mu9_TrkIsoVVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu19_TrkIsoVVL_Mu9_TrkIsoVVL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu19_TrkIsoVVL_Mu9_TrkIsoVVL_DZ_Mass3p8** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu19_TrkIsoVVL_Mu9_TrkIsoVVL_DZ_Mass8** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu20** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu20NoFiltersNoVtxDisplaced_Photon20_CaloCustomId** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu23_TrkIsoVVL_Ele12_CaloIdL_TrackIdL_IsoVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu23_TrkIsoVVL_Ele12_CaloIdL_TrackIdL_IsoVL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu25_TkMu0_Phi** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu27** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu27_Ele37_CaloIdL_MW** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu30_TkMu0_Psi** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu30_TkMu0_Upsilon** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu37_Ele27_CaloIdL_MW** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu37_TkMu27** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu38NoFiltersNoVtxDisplaced_Photon38_CaloIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu3_L1SingleMu5orSingleMu7** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu3_PFJet40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMET100_PFMHT100_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMET80_PFMHT80_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMET90_PFMHT90_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMETNoMu100_PFMHTNoMu100_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMETNoMu80_PFMHTNoMu80_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu3er1p5_PFJet100er2p5_PFMETNoMu90_PFMHTNoMu90_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu43NoFiltersNoVtxDisplaced_Photon43_CaloIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu43NoFiltersNoVtx_Photon43_CaloIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu48NoFiltersNoVtx_Photon48_CaloIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu4_L1DoubleMu** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu50_IsoVVVL_PFHT450** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu50_L1SingleMuShower** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu55** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet30_Inclusive1PtrkShortSig5_DisplacedLoose** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet35_Inclusive0PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet35_Inclusive1PtrkShortSig5_DisplacedLoose** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet40_Inclusive0PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet40_Inclusive1PtrkShortSig5_DisplacedLoose** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet45_Inclusive0PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu6HT240_DisplacedDijet50_Inclusive0PtrkShortSig5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu6_Barrel_L1HP7_IP6** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu7_Barrel_L1HP8_IP6** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu7p5_L2Mu2_Jpsi** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu7p5_L2Mu2_Upsilon** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_Barrel_L1HP9_IP6** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_DiEle12_CaloIdL_TrackIdL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_DiEle12_CaloIdL_TrackIdL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_Ele8_CaloIdM_TrackIdM_Mass8_PFHT350** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_Ele8_CaloIdM_TrackIdM_Mass8_PFHT350_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_TrkIsoVVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_CaloDiJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_DoubleAK4PFJet60_30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_DoubleAK4PFJet60_30_PNet2BTagMean0p50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFDiJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFDiJet30_PFBtagDeepJet_1p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFDiJet30_PNet2BTagMean0p50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFHT250** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFHT250_QuadPFJet25** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFHT250_QuadPFJet25_PNet1BTag0p20** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFHT250_QuadPFJet25_PNet2BTagMean0p55** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFHT280** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFHT280_QuadPFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Mu8_TrkIsoVVL_Ele23_CaloIdL_TrackIdL_IsoVL_DZ_PFHT280_QuadPFJet30_PNet2BTagMean0p55** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Mu9_Barrel_L1HP10_IP6** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT1050** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT180** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT250** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT250_QuadPFJet25** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT250_QuadPFJet25_PNet1BTag0p20_PNet1Tauh0p50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_PFHT250_QuadPFJet25_PNet2BTagMean0p55** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_PFHT250_QuadPFJet30_PNet1BTag0p20_PNet1Tauh0p50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_PFHT250_QuadPFJet30_PNet2BTagMean0p55** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_PFHT280_QuadPFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT280_QuadPFJet30_PNet1BTag0p20_PNet1Tauh0p50** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_PFHT280_QuadPFJet30_PNet2BTagMean0p55** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_PFHT280_QuadPFJet30_PNet2BTagMean0p60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFHT280_QuadPFJet35_PNet2BTagMean0p60** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT330PT30_QuadPFJet_75_60_45_40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT330PT30_QuadPFJet_75_60_45_40_PNet3BTag_2p0** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT330PT30_QuadPFJet_75_60_45_40_PNet3BTag_4p3** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT330PT30_QuadPFJet_75_60_45_40_TriplePFBTagDeepJet_4p5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT340_QuadPFJet70_50_40_40_PNet2BTagMean0p70** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT350** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT370** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT400_FivePFJet_120_120_60_30_30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT400_FivePFJet_120_120_60_30_30_PNet2BTag_4p3** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT400_FivePFJet_120_120_60_30_30_PNet2BTag_5p6** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT400_SixPFJet32** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT400_SixPFJet32_PNet2BTagMean0p50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT430** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT450_SixPFJet36** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT450_SixPFJet36_PNetBTag0p35** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT500_PFMET100_PFMHT100_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT500_PFMET110_PFMHT110_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT510** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT590** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT680** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT700_PFMET85_PFMHT85_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT780** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT800_PFMET75_PFMHT75_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFHT890** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet110** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet140** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet200** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet200_TimeGt2p5ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet200_TimeLtNeg2p5ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet260** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet320** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet400** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet40_GPUvsCPU** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet450** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet500** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet550** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet60** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJet80** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJetFwd140** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJetFwd200** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJetFwd260** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJetFwd320** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJetFwd40** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJetFwd400** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJetFwd450** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJetFwd500** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJetFwd60** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFJetFwd80** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMET105_IsoTrk50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMET120_PFMHT120_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMET120_PFMHT120_IDTight_PFHT60** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMET130_PFMHT130_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMET140_PFMHT140_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMET200_BeamHaloCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMET200_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMET250_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMET300_NotCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMETNoMu110_PFMHTNoMu110_IDTight_FilterHF** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMETNoMu120_PFMHTNoMu120_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMETNoMu120_PFMHTNoMu120_IDTight_FilterHF** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETNoMu120_PFMHTNoMu120_IDTight_PFHT60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_PFMETNoMu130_PFMHTNoMu130_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMETNoMu130_PFMHTNoMu130_IDTight_FilterHF** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMETNoMu140_PFMHTNoMu140_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMETNoMu140_PFMHTNoMu140_IDTight_FilterHF** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMETTypeOne140_PFMHT140_IDTight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PFMETTypeOne200_BeamHaloCleaned** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PPSMaxTracksPerArm1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PPSMaxTracksPerRP4** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_PPSRandom** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon100EBHE10** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon110EB_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon110EB_TightID_TightIso_AK8CaloJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon110EB_TightID_TightIso_AK8PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon110EB_TightID_TightIso_CaloJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon110EB_TightID_TightIso_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon120** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon120_R9Id90_HE10_IsoM** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon150** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon165_R9Id90_HE10_IsoM** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon175** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon200** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon20_HoverELoose** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_Photon300_NoHE** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon30EB_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon30_HoverELoose** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon32_OneProng32_M50To105** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon33** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon34_R9Id90_CaloIdL_IsoL_DisplacedIdL_MediumChargedIsoDisplacedPFTauHPS34** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.3%|
| **HLT_Photon35_TwoProngs35** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.3%|
| **HLT_Photon40EB** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon40EB_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon45EB** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon45EB_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.6%|
| **HLT_Photon50** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon50EB** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon50EB_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.5%|
| **HLT_Photon50EB_TightID_TightIso_AK8CaloJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.5%|
| **HLT_Photon50EB_TightID_TightIso_AK8PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.5%|
| **HLT_Photon50EB_TightID_TightIso_CaloJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.5%|
| **HLT_Photon50EB_TightID_TightIso_PFJet30** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.5%|
| **HLT_Photon50_R9Id90_HE10_IsoM** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon50_TimeGt2p5ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon50_TimeLtNeg2p5ns** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon55EB_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.2| 0.2| 0.5%|
| **HLT_Photon60_R9Id90_CaloIdL_IsoL_DisplacedIdL_PFHT350** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon60_R9Id90_CaloIdL_IsoL_DisplacedIdL_PFHT380** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon60_R9Id90_CaloIdL_IsoL_DisplacedIdL_PFHT400** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon60_R9Id90_HE10_IsoM_EBOnly_PFJetsMJJ300DEta3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon75** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon75EB_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.3%|
| **HLT_Photon75_R9Id90_HE10_IsoM** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon75_R9Id90_HE10_IsoM_EBOnly_PFJetsMJJ300DEta3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon90** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Photon90EB_TightID_TightIso** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Photon90_R9Id90_HE10_IsoM** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Physics** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet100_88_70_30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet100_88_70_30_PNet1CvsAll0p5_VBF3Tight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet103_88_75_15** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet103_88_75_15_PNet2BTag_0p4_0p12_VBF1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet103_88_75_15_PNetBTag_0p4_VBF2** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet105_88_75_30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet105_88_75_30_PNet1CvsAll0p5_VBF3Tight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet105_88_76_15** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet105_88_76_15_PNet2BTag_0p4_0p12_VBF1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet105_88_76_15_PNetBTag_0p4_VBF2** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet111_90_80_15** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet111_90_80_15_PNet2BTag_0p4_0p12_VBF1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet111_90_80_15_PNetBTag_0p4_VBF2** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet111_90_80_30** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_QuadPFJet111_90_80_30_PNet1CvsAll0p6_VBF3Tight** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Random** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_SingleEle8** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_SingleEle8_SingleEGL1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_SinglePNetTauhPFJet130_Loose_L2NN_eta2p3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_SinglePNetTauhPFJet130_Medium_L2NN_eta2p3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_SinglePNetTauhPFJet130_Tight_L2NN_eta2p3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_Tau3Mu_Mu7_Mu1_TkMu1_IsoTau15** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Tau3Mu_Mu7_Mu1_TkMu1_IsoTau15_Charge1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Tau3Mu_Mu7_Mu1_TkMu1_Tau15** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Tau3Mu_Mu7_Mu1_TkMu1_Tau15_Charge1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_Trimuon5_3p5_2_Upsilon_Muon** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_TrimuonOpen_5_3p5_2_Upsilon_Muon** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_TripleMu_10_5_5_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_TripleMu_12_10_5** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_TripleMu_5_3_3_Mass3p8_DCA** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_TripleMu_5_3_3_Mass3p8_DZ** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_TrkMu12_DoubleTrkMu5NoFiltersNoVtx** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_UncorrectedJetE30_NoBPTX** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_UncorrectedJetE30_NoBPTX3BX** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_UncorrectedJetE60_NoBPTX3BX** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_UncorrectedJetE70_NoBPTX3BX** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_VBF_DiPFJet125_45_Mjj1050** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_VBF_DiPFJet125_45_Mjj1200** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_VBF_DiPFJet45_Mjj650_MediumDeepTauPFTauHPS45_L2NN_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_VBF_DiPFJet45_Mjj650_PNetTauhPFJet45_L2NN_eta2p3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_VBF_DiPFJet45_Mjj750_MediumDeepTauPFTauHPS45_L2NN_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_VBF_DiPFJet45_Mjj750_PNetTauhPFJet45_L2NN_eta2p3** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_VBF_DiPFJet50_Mjj600_Ele22_eta2p1_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_VBF_DiPFJet50_Mjj650_Ele22_eta2p1_WPTight_Gsf** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_VBF_DiPFJet50_Mjj650_Photon22** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_VBF_DiPFJet50_Mjj750_Photon22** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_VBF_DiPFJet75_45_Mjj800_DiPFJet60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_VBF_DiPFJet75_45_Mjj850_DiPFJet60** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.2%|
| **HLT_VBF_DiPFJet80_45_Mjj650_PFMETNoMu85** | Bool_t| Trigger/flag bit (process: HLT) | 0.1| 0.1| 0.1%|
| **HLT_VBF_DiPFJet80_45_Mjj750_PFMETNoMu85** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_VBF_DiPFJet95_45_Mjj750_Mu3_TrkIsoVVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_VBF_DiPFJet95_45_Mjj850_Mu3_TrkIsoVVL** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_VBF_DoubleMediumDeepTauPFTauHPS20_eta2p1** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_VBF_DoublePNetTauhPFJet20_eta2p2** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_ZeroBias** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_ZeroBias_Alignment** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_ZeroBias_Beamspot** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_ZeroBias_FirstBXAfterTrain** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_ZeroBias_FirstCollisionAfterAbortGap** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_ZeroBias_FirstCollisionInTrain** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_ZeroBias_IsolatedBunches** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|
| **HLT_ZeroBias_LastCollisionInTrain** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 0.1%|

### HLTriggerFinalPath
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **HLTriggerFinalPath** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 100.0%|

### HLTriggerFirstPath
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **HLTriggerFirstPath** | Bool_t| Trigger/flag bit (process: HLT) | 0.0| 0.0| 100.0%|

### IsoTrack
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **IsoTrack_charge** | Short_t| electric charge | 0.5| 1.2| 3.5%|
| **IsoTrack_dxy** | Float_t| dxy (with sign) wrt first PV, in cm | 1.5| 3.5| 9.9%|
| **IsoTrack_dz** | Float_t| dz (with sign) wrt first PV, in cm | 1.5| 3.5| 9.8%|
| **IsoTrack_eta** | Float_t| eta | 1.5| 3.5| 10.1%|
| **IsoTrack_fromPV** | Short_t| isolated track comes from PV | 0.6| 1.3| 3.8%|
| **IsoTrack_isFromLostTrack** | Bool_t| if isolated track comes from a lost track | 0.5| 1.2| 3.3%|
| **IsoTrack_isHighPurityTrack** | Bool_t| track is high purity | 0.5| 1.2| 3.4%|
| **IsoTrack_isPFcand** | Bool_t| if isolated track is a PF candidate | 0.4| 1.0| 2.8%|
| **IsoTrack_miniPFRelIso_all** | Float_t| mini PF relative isolation, total (with scaled rho*EA PU corrections) | 1.2| 2.7| 7.7%|
| **IsoTrack_miniPFRelIso_chg** | Float_t| mini PF relative isolation, charged component | 0.9| 2.1| 5.9%|
| **IsoTrack_pdgId** | Int_t| PDG id of PF cand | 0.6| 1.3| 3.7%|
| **IsoTrack_pfRelIso03_all** | Float_t| PF relative isolation dR=0.3, total (deltaBeta corrections) | 1.3| 2.9| 8.3%|
| **IsoTrack_pfRelIso03_chg** | Float_t| PF relative isolation dR=0.3, charged component | 1.1| 2.6| 7.3%|
| **IsoTrack_phi** | Float_t| phi | 1.5| 3.5| 10.1%|
| **IsoTrack_pt** | Float_t| pt | 1.3| 3.0| 8.5%|
| **nIsoTrack** | Int_t| isolated tracks after basic selection (((pt>5 && (abs(pdgId) == 11 \|\| abs(pdgId) == 13)) \|\| pt > 10) && (abs(pdgId) < 15 \|\| abs(eta) < 2.5) && ((abs(dxy) < 0.2 && abs(dz) < 0.1) \|\| pt>15) && ((pfIsolationDR03().chargedHadronIso < 5 && pt < 25) \|\| pfIsolationDR03().chargedHadronIso/pt < 0.2)) and lepton veto | 0.3| 0.6| 1.8%|

### Jet
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Jet_PNetRegPtRawCorr** | Float_t| ParticleNet universal flavor-aware visible pT regression (no neutrinos), correction relative to raw jet pT | 6.6| 1.6| 1.9%|
| **Jet_PNetRegPtRawCorrNeutrino** | Float_t| ParticleNet universal flavor-aware pT regression neutrino correction, relative to visible. To apply full regression, multiply raw jet pT by both PNetRegPtRawCorr and PNetRegPtRawCorrNeutrino. | 4.9| 1.2| 1.4%|
| **Jet_PNetRegPtRawRes** | Float_t| ParticleNet universal flavor-aware jet pT resolution estimator, (q84 - q16)/2 | 7.8| 1.9| 2.2%|
| **Jet_UParTAK4RegPtRawCorr** | Float_t| UnifiedParT universal flavor-aware visible pT regression (no neutrinos), correction relative to raw jet pT | 6.0| 1.5| 1.7%|
| **Jet_UParTAK4RegPtRawCorrNeutrino** | Float_t| UnifiedParT universal flavor-aware pT regression neutrino correction, relative to visible. Correction relative to raw jet pT | 5.9| 1.4| 1.7%|
| **Jet_UParTAK4RegPtRawRes** | Float_t| UnifiedParT universal flavor-aware jet pT resolution estimator, (q84 - q16)/2 | 6.9| 1.7| 2.0%|
| **Jet_UParTAK4V1RegPtRawCorr** | Float_t| UnifiedParT V1 universal flavor-aware visible pT regression (no neutrinos), correction relative to raw jet pT | 6.0| 1.5| 1.7%|
| **Jet_UParTAK4V1RegPtRawCorrNeutrino** | Float_t| UnifiedParT V1 universal flavor-aware pT regression neutrino correction, relative to visible. Correction relative to raw jet pT | 5.7| 1.4| 1.6%|
| **Jet_UParTAK4V1RegPtRawRes** | Float_t| UnifiedParT V1 universal flavor-aware jet pT resolution estimator, (q84 - q16)/2 | 6.9| 1.7| 2.0%|
| **Jet_area** | Float_t| jet catchment area, for JECs | 3.9| 0.9| 1.1%|
| **Jet_btagDeepFlavB** | Float_t| DeepJet b+bb+lepb tag discriminator | 8.5| 2.1| 2.4%|
| **Jet_btagDeepFlavCvB** | Float_t| DeepJet c vs b+bb+lepb discriminator | 7.1| 1.7| 2.0%|
| **Jet_btagDeepFlavCvL** | Float_t| DeepJet c vs uds+g discriminator | 8.1| 2.0| 2.3%|
| **Jet_btagDeepFlavQG** | Float_t| DeepJet g vs uds discriminator | 7.5| 1.9| 2.1%|
| **Jet_btagPNetB** | Float_t| ParticleNet b vs. udscg | 7.4| 1.8| 2.1%|
| **Jet_btagPNetCvB** | Float_t| ParticleNet c vs. b | 6.2| 1.5| 1.8%|
| **Jet_btagPNetCvL** | Float_t| ParticleNet c vs. udsg | 7.0| 1.7| 2.0%|
| **Jet_btagPNetCvNotB** | Float_t| ParticleNet C vs notB | 7.4| 1.8| 2.1%|
| **Jet_btagPNetQvG** | Float_t| ParticleNet q (udsbc) vs. g | 7.6| 1.9| 2.1%|
| **Jet_btagPNetTauVJet** | Float_t| ParticleNet tau vs. jet | 7.7| 1.9| 2.2%|
| **Jet_btagUParTAK4B** | Float_t| UnifiedParT b vs. udscg | 8.2| 2.0| 2.3%|
| **Jet_btagUParTAK4CvB** | Float_t| UnifiedParT c vs. b | 6.3| 1.6| 1.8%|
| **Jet_btagUParTAK4CvL** | Float_t| UnifiedParT c vs. udsg | 7.8| 1.9| 2.2%|
| **Jet_btagUParTAK4CvNotB** | Float_t| UnifiedParT c vs. not b | 8.0| 2.0| 2.3%|
| **Jet_btagUParTAK4Ele** | Float_t| UnifiedParT electron raw score | 8.2| 2.0| 2.3%|
| **Jet_btagUParTAK4Mu** | Float_t| UnifiedParT muon raw score | 8.1| 2.0| 2.3%|
| **Jet_btagUParTAK4QvG** | Float_t| UnifiedParT q (uds) vs. g | 6.9| 1.7| 2.0%|
| **Jet_btagUParTAK4SvCB** | Float_t| UnifiedParT s vs. bc | 8.0| 2.0| 2.3%|
| **Jet_btagUParTAK4SvUDG** | Float_t| UnifiedParT s vs. udg | 7.7| 1.9| 2.2%|
| **Jet_btagUParTAK4TauVJet** | Float_t| UnifiedParT tau vs. jet | 8.2| 2.0| 2.3%|
| **Jet_btagUParTAK4UDG** | Float_t| UnifiedParT u+d+g raw score | 7.7| 1.9| 2.2%|
| **Jet_btagUParTAK4probb** | Float_t| UnifiedParT b raw score | 8.2| 2.0| 2.3%|
| **Jet_btagUParTAK4probbb** | Float_t| UnifiedParT bb raw score | 8.3| 2.0| 2.3%|
| **Jet_chEmEF** | Float_t| charged Electromagnetic Energy Fraction | 2.4| 0.6| 0.7%|
| **Jet_chHEF** | Float_t| charged Hadron Energy Fraction | 7.0| 1.7| 2.0%|
| **Jet_chMultiplicity** | UChar_t| (Puppi-weighted) Number of charged particles in the jet | 2.7| 0.7| 0.8%|
| **Jet_electronIdx1** | Short_t(index to Electron)| index of first matching electron | 1.5| 0.4| 0.4%|
| **Jet_electronIdx2** | Short_t(index to Electron)| index of second matching electron | 1.0| 0.2| 0.3%|
| **Jet_eta** | Float_t| eta | 10.0| 2.5| 2.8%|
| **Jet_hfEmEF** | Float_t| electromagnetic Energy Fraction in HF | 1.0| 0.3| 0.3%|
| **Jet_hfHEF** | Float_t| hadronic Energy Fraction in HF | 2.0| 0.5| 0.6%|
| **Jet_hfadjacentEtaStripsSize** | Int_t| eta size of the strips next to the central tower strip in HF (noise discriminating variable) | 1.1| 0.3| 0.3%|
| **Jet_hfcentralEtaStripSize** | Int_t| eta size of the central tower strip in HF (noise discriminating variable) | 1.2| 0.3| 0.4%|
| **Jet_hfsigmaEtaEta** | Float_t| sigmaEtaEta for HF jets (noise discriminating variable) | 1.8| 0.4| 0.5%|
| **Jet_hfsigmaPhiPhi** | Float_t| sigmaPhiPhi for HF jets (noise discriminating variable) | 1.8| 0.4| 0.5%|
| **Jet_mass** | Float_t| mass | 8.3| 2.0| 2.4%|
| **Jet_muEF** | Float_t| muon Energy Fraction | 1.5| 0.4| 0.4%|
| **Jet_muonIdx1** | Short_t(index to Muon)| index of first matching muon | 1.1| 0.3| 0.3%|
| **Jet_muonIdx2** | Short_t(index to Muon)| index of second matching muon | 0.9| 0.2| 0.3%|
| **Jet_muonSubtrDeltaEta** | Float_t| muon-subtracted raw eta - eta | 4.9| 1.2| 1.4%|
| **Jet_muonSubtrDeltaPhi** | Float_t| muon-subtracted raw phi - phi | 2.4| 0.6| 0.7%|
| **Jet_muonSubtrFactor** | Float_t| 1-(muon-subtracted raw pt)/(raw pt) | 6.6| 1.6| 1.9%|
| **Jet_nConstituents** | UChar_t| Number of particles in the jet | 3.0| 0.7| 0.8%|
| **Jet_nElectrons** | UChar_t| number of electrons in the jet | 1.3| 0.3| 0.4%|
| **Jet_nMuons** | UChar_t| number of muons in the jet | 0.9| 0.2| 0.3%|
| **Jet_nSVs** | UChar_t| number of secondary vertices in the jet | 1.4| 0.3| 0.4%|
| **Jet_neEmEF** | Float_t| neutral Electromagnetic Energy Fraction | 6.5| 1.6| 1.8%|
| **Jet_neHEF** | Float_t| neutral Hadron Energy Fraction | 6.1| 1.5| 1.7%|
| **Jet_neMultiplicity** | UChar_t| (Puppi-weighted) Number of neutral particles in the jet | 2.4| 0.6| 0.7%|
| **Jet_phi** | Float_t| phi | 10.1| 2.5| 2.9%|
| **Jet_pt** | Float_t| pt | 7.9| 1.9| 2.2%|
| **Jet_puIdDisc** | Float_t| Pileup ID BDT discriminant with 133X Winter24 PuppiV18 training | 7.6| 1.9| 2.2%|
| **Jet_rawFactor** | Float_t| 1 - Factor to get back to raw pT | 6.0| 1.5| 1.7%|
| **Jet_svIdx1** | Short_t(index to Sv)| index of first matching secondary vertex | 1.7| 0.4| 0.5%|
| **Jet_svIdx2** | Short_t(index to Sv)| index of second matching secondary vertex | 1.2| 0.3| 0.3%|
| **nJet** | Int_t| slimmedJetsPuppi, i.e. ak4 PFJets Puppi with JECs applied, after basic selection (pt > 15) | 0.5| 0.1| 0.1%|

### L1
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **L1_AXO_Loose** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_AXO_Loose_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_AXO_Nominal** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_AXO_Nominal_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_AXO_Tight** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_AXO_Tight_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_AXO_VLoose** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_AXO_VLoose_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_AXO_VTight** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_AXO_VTight_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_AlwaysTrue** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_AlwaysTrue_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BPTX_AND_Ref1_VME** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BPTX_AND_Ref1_VME_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BPTX_AND_Ref3_VME** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BPTX_AND_Ref3_VME_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BPTX_AND_Ref4_VME** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BPTX_AND_Ref4_VME_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BPTX_BeamGas_B1_VME** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BPTX_BeamGas_B1_VME_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BPTX_BeamGas_B2_VME** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BPTX_BeamGas_B2_VME_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BPTX_BeamGas_Ref1_VME** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BPTX_BeamGas_Ref1_VME_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BPTX_BeamGas_Ref2_VME** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BPTX_BeamGas_Ref2_VME_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BPTX_NotOR_VME** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BPTX_NotOR_VME_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BPTX_OR_Ref3_VME** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BPTX_OR_Ref3_VME_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BPTX_OR_Ref4_VME** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BPTX_OR_Ref4_VME_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BPTX_RefAND_VME** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BPTX_RefAND_VME_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BptxMinus** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BptxMinus_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BptxOR** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BptxOR_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BptxPlus** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BptxPlus_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_BptxXOR** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_BptxXOR_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_CDC_SingleMu_3_er1p2_TOP120_DPHI2p618_3p142** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_CDC_SingleMu_3_er1p2_TOP120_DPHI2p618_3p142_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleEG11_er1p2_dR_Max0p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG11_er1p2_dR_Max0p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG8er2p5_HTT280er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleEG8er2p5_HTT280er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleEG8er2p5_HTT300er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG8er2p5_HTT300er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG8er2p5_HTT320er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG8er2p5_HTT320er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG_15_10_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleEG_15_10_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleEG_20_10_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleEG_20_10_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleEG_22_10_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleEG_22_10_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleEG_25_12_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_25_12_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_25_14_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_25_14_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_27_14_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_27_14_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_LooseIso16_LooseIso12_er1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleEG_LooseIso16_LooseIso12_er1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleEG_LooseIso18_LooseIso12_er1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG_LooseIso18_LooseIso12_er1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG_LooseIso20_LooseIso12_er1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG_LooseIso20_LooseIso12_er1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG_LooseIso22_12_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_LooseIso22_12_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_LooseIso22_LooseIso12_er1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG_LooseIso22_LooseIso12_er1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG_LooseIso25_12_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_LooseIso25_12_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_DoubleEG_LooseIso25_LooseIso12_er1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleEG_LooseIso25_LooseIso12_er1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleIsoTau26er2p1_Jet55_RmOvlp_dR0p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.3%|
| **L1_DoubleIsoTau26er2p1_Jet55_RmOvlp_dR0p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.3%|
| **L1_DoubleIsoTau26er2p1_Jet70_RmOvlp_dR0p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.3%|
| **L1_DoubleIsoTau26er2p1_Jet70_RmOvlp_dR0p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.3%|
| **L1_DoubleIsoTau28er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleIsoTau28er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleIsoTau30er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleIsoTau30er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleIsoTau32er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleIsoTau32er2p1_Mass_Max80** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleIsoTau32er2p1_Mass_Max80_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleIsoTau32er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleIsoTau34er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_DoubleIsoTau34er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_DoubleIsoTau35er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_DoubleIsoTau35er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_DoubleIsoTau36er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_DoubleIsoTau36er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_DoubleJet100er2p3_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet100er2p3_dEta_Max1p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet100er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet100er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet112er2p3_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet112er2p3_dEta_Max1p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet120er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet120er2p5_Mu3_dR_Max0p8** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet120er2p5_Mu3_dR_Max0p8_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet120er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet150er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet150er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet16er2p5_Mu3_dR_Max0p4** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet16er2p5_Mu3_dR_Max0p4_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet30er2p5_Mass_Min225_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet30er2p5_Mass_Min225_dEta_Max1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet30er2p5_Mass_Min250_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.3%|
| **L1_DoubleJet30er2p5_Mass_Min250_dEta_Max1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.3%|
| **L1_DoubleJet30er2p5_Mass_Min300_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet30er2p5_Mass_Min300_dEta_Max1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet30er2p5_Mass_Min330_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet30er2p5_Mass_Min330_dEta_Max1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet35er2p5_Mu3_dR_Max0p4** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet35er2p5_Mu3_dR_Max0p4_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet40er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet40er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet45_Mass_Min550_IsoTau45er2p1_RmOvlp_dR0p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet45_Mass_Min550_IsoTau45er2p1_RmOvlp_dR0p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet45_Mass_Min550_LooseIsoEG20er2p1_RmOvlp_dR0p2** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet45_Mass_Min550_LooseIsoEG20er2p1_RmOvlp_dR0p2_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet45_Mass_Min600_IsoTau45er2p1_RmOvlp_dR0p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet45_Mass_Min600_IsoTau45er2p1_RmOvlp_dR0p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet45_Mass_Min600_LooseIsoEG20er2p1_RmOvlp_dR0p2** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet45_Mass_Min600_LooseIsoEG20er2p1_RmOvlp_dR0p2_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet60er2p5_Mu3_dR_Max0p4** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet60er2p5_Mu3_dR_Max0p4_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet80er2p5_Mu3_dR_Max0p4** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet80er2p5_Mu3_dR_Max0p4_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleJet_110_35_DoubleJet35_Mass_Min800** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_110_35_DoubleJet35_Mass_Min800_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_110_35_DoubleJet35_Mass_Min850** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_110_35_DoubleJet35_Mass_Min850_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_65_35_DoubleJet35_Mass_Min600_DoubleJetCentral50** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_65_35_DoubleJet35_Mass_Min600_DoubleJetCentral50_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_65_35_DoubleJet35_Mass_Min650_DoubleJetCentral50** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_65_35_DoubleJet35_Mass_Min650_DoubleJetCentral50_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_70_35_DoubleJet35_Mass_Min500_ETMHF65** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_70_35_DoubleJet35_Mass_Min500_ETMHF65_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_70_35_DoubleJet35_Mass_Min550_ETMHF65** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_70_35_DoubleJet35_Mass_Min550_ETMHF65_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_85_35_DoubleJet35_Mass_Min600_Mu3OQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_DoubleJet_85_35_DoubleJet35_Mass_Min600_Mu3OQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleJet_85_35_DoubleJet35_Mass_Min650_Mu3OQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_DoubleJet_85_35_DoubleJet35_Mass_Min650_Mu3OQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_DoubleLLPJet40** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleLLPJet40_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleLooseIsoEG22er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleLooseIsoEG22er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleLooseIsoEG24er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleLooseIsoEG24er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_DoubleMu0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Mass_Min1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Mass_Min1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_OQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_OQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_SQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_SQ_OS** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_SQ_OS_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_SQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Upt15_Upt7** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Upt15_Upt7_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Upt5_Upt5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Upt5_Upt5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Upt6_IP_Min1_Upt4** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Upt6_IP_Min1_Upt4_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Upt6_SQ_er2p0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Upt6_SQ_er2p0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Upt7_SQ_er2p0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Upt7_SQ_er2p0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Upt8_SQ_er2p0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_Upt8_SQ_er2p0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_dR_Max1p6_Jet90er2p5_dR_Max0p8** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_dR_Max1p6_Jet90er2p5_dR_Max0p8_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p4_OQ_OS_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p4_OQ_OS_dEta_Max1p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p4_SQ_OS_dEta_Max1p2** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p4_SQ_OS_dEta_Max1p2_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p4_SQ_OS_dR_Max1p4** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p4_SQ_OS_dR_Max1p4_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p5_SQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p5_SQ_OS** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p5_SQ_OS_dEta_Max1p2** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p5_SQ_OS_dEta_Max1p2_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p5_SQ_OS_dR_Max1p4** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p5_SQ_OS_dR_Max1p4_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p5_SQ_OS_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p5_SQ_dR_Max1p4** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p5_SQ_dR_Max1p4_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er1p5_SQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er2p0_SQ_OS_dEta_Max0p3_dPhi_0p8to1p2** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er2p0_SQ_OS_dEta_Max0p3_dPhi_0p8to1p2_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er2p0_SQ_OS_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er2p0_SQ_OS_dEta_Max1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er2p0_SQ_OS_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er2p0_SQ_OS_dEta_Max1p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er2p0_SQ_dEta_Max1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er2p0_SQ_dEta_Max1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er2p0_SQ_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu0er2p0_SQ_dEta_Max1p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu18er2p1_SQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu18er2p1_SQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_OS_er2p3_Mass_Max14_DoubleEG7p5_er2p1_Mass_Max20** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_OS_er2p3_Mass_Max14_DoubleEG7p5_er2p1_Mass_Max20_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF30_HTT60er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF30_HTT60er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF30_Jet60er2p5_OR_DoubleJet40er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF30_Jet60er2p5_OR_DoubleJet40er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF40_HTT60er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF40_HTT60er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF40_Jet60er2p5_OR_DoubleJet40er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF40_Jet60er2p5_OR_DoubleJet40er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF50_HTT60er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF50_HTT60er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF50_Jet60er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF50_Jet60er2p5_OR_DoubleJet40er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF50_Jet60er2p5_OR_DoubleJet40er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF50_Jet60er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF60_Jet60er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_ETMHF60_Jet60er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_HTT220er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3_SQ_HTT220er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3er2p0_SQ_OS_dR_Max1p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu3er2p0_SQ_OS_dR_Max1p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4_SQ_EG9er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4_SQ_EG9er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4_SQ_OS** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4_SQ_OS_dR_Max1p2** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4_SQ_OS_dR_Max1p2_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4_SQ_OS_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4er2p0_SQ_OS_dR_Max1p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4er2p0_SQ_OS_dR_Max1p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4p5_SQ_OS** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4p5_SQ_OS_dR_Max1p2** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4p5_SQ_OS_dR_Max1p2_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4p5_SQ_OS_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4p5er2p0_SQ_OS** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4p5er2p0_SQ_OS_Mass_7to18** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4p5er2p0_SQ_OS_Mass_7to18_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4p5er2p0_SQ_OS_Mass_Min7** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4p5er2p0_SQ_OS_Mass_Min7_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu4p5er2p0_SQ_OS_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu5_OS_er2p3_Mass_8to14_DoubleEG3er2p1_Mass_Max20** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu5_OS_er2p3_Mass_8to14_DoubleEG3er2p1_Mass_Max20_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu5_SQ_EG9er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu5_SQ_EG9er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu5_SQ_OS_dR_Max1p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu5_SQ_OS_dR_Max1p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu6_Upt6_SQ_er2p0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu6_Upt6_SQ_er2p0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu7_Upt7_SQ_er2p0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu7_Upt7_SQ_er2p0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu8_SQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu8_SQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu8_Upt8_SQ_er2p0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu8_Upt8_SQ_er2p0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu9_SQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu9_SQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu_12_5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu_12_5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu_15_5_SQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu_15_5_SQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu_15_7** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu_15_7_Mass_Min1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu_15_7_Mass_Min1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu_15_7_SQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu_15_7_SQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleMu_15_7_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_DoubleTau70er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_DoubleTau70er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETM120** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_ETM120_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_ETM150** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETM150_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF100** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF100_HTT60er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF100_HTT60er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF100_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF110** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF110_HTT60er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF110_HTT60er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF110_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF120** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF120_HTT60er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF120_HTT60er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF120_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF130** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF130_HTT60er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF130_HTT60er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF130_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF140** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF140_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF150** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF150_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF70** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_ETMHF70_HTT60er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_ETMHF70_HTT60er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_ETMHF70_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_ETMHF80** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_ETMHF80_HTT60er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_ETMHF80_HTT60er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_ETMHF80_SingleJet55er2p5_dPhi_Min2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_ETMHF80_SingleJet55er2p5_dPhi_Min2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_ETMHF80_SingleJet55er2p5_dPhi_Min2p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_ETMHF80_SingleJet55er2p5_dPhi_Min2p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_ETMHF80_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_ETMHF90** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF90_HTT60er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF90_HTT60er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF90_SingleJet60er2p5_dPhi_Min2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF90_SingleJet60er2p5_dPhi_Min2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF90_SingleJet60er2p5_dPhi_Min2p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETMHF90_SingleJet60er2p5_dPhi_Min2p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETMHF90_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_ETT2000** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_ETT2000_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_FinalOR_BXmin1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_FinalOR_BXmin1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_FinalOR_BXmin2** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_FinalOR_BXmin2_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_FirstBunchAfterTrain** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_FirstBunchAfterTrain_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_FirstBunchBeforeTrain** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_FirstBunchBeforeTrain_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_FirstBunchInTrain** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_FirstBunchInTrain_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_FirstCollisionInOrbit** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_FirstCollisionInOrbit_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_FirstCollisionInTrain** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_FirstCollisionInTrain_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_HCAL_LaserMon_Trig** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_HCAL_LaserMon_Trig_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_HCAL_LaserMon_Veto** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_HCAL_LaserMon_Veto_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_HTT120_SingleLLPJet40** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_HTT120_SingleLLPJet40_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_HTT120er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_HTT120er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_HTT160_SingleLLPJet50** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_HTT160_SingleLLPJet50_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_HTT160er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_HTT160er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_HTT200_SingleLLPJet60** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_HTT200_SingleLLPJet60_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_HTT200er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_HTT200er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_HTT240_SingleLLPJet70** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_HTT240_SingleLLPJet70_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_HTT255er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_HTT255er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_HTT280er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.3%|
| **L1_HTT280er_QuadJet_70_55_40_35_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_HTT280er_QuadJet_70_55_40_35_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_HTT280er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.3%|
| **L1_HTT320er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.3%|
| **L1_HTT320er_QuadJet_70_55_40_40_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_HTT320er_QuadJet_70_55_40_40_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_HTT320er_QuadJet_80_60_er2p1_45_40_er2p3** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_HTT320er_QuadJet_80_60_er2p1_45_40_er2p3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_HTT320er_QuadJet_80_60_er2p1_50_45_er2p3** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_HTT320er_QuadJet_80_60_er2p1_50_45_er2p3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_HTT320er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.3%|
| **L1_HTT360er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_HTT360er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_HTT400er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_HTT400er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_HTT450er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_HTT450er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_IsoEG32er2p5_Mt40** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_IsoEG32er2p5_Mt40_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_IsoTau52er2p1_QuadJet36er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_IsoTau52er2p1_QuadJet36er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_IsolatedBunch** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_IsolatedBunch_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_LastBunchInTrain** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_LastBunchInTrain_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_LastCollisionInTrain** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_LastCollisionInTrain_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_LooseIsoEG14er2p5_HTT200er** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG14er2p5_HTT200er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG16er2p5_HTT200er** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG16er2p5_HTT200er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG22er2p1_IsoTau26er2p1_dR_Min0p3** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG22er2p1_IsoTau26er2p1_dR_Min0p3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG22er2p1_Tau70er2p1_dR_Min0p3** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.3%|
| **L1_LooseIsoEG22er2p1_Tau70er2p1_dR_Min0p3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.3%|
| **L1_LooseIsoEG24er2p1_HTT100er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_LooseIsoEG24er2p1_HTT100er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_LooseIsoEG24er2p1_IsoTau27er2p1_dR_Min0p3** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG24er2p1_IsoTau27er2p1_dR_Min0p3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_LooseIsoEG26er2p1_HTT100er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_LooseIsoEG26er2p1_HTT100er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_LooseIsoEG26er2p1_Jet34er2p5_dR_Min0p3** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_LooseIsoEG26er2p1_Jet34er2p5_dR_Min0p3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_LooseIsoEG28er2p1_HTT100er** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_LooseIsoEG28er2p1_HTT100er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_LooseIsoEG28er2p1_Jet34er2p5_dR_Min0p3** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_LooseIsoEG28er2p1_Jet34er2p5_dR_Min0p3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_LooseIsoEG30er2p1_Jet34er2p5_dR_Min0p3** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_LooseIsoEG30er2p1_Jet34er2p5_dR_Min0p3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_MHT120** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_MHT120_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_MHT150** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_MHT150_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_MHT200** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_MHT200_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_MinimumBiasHF0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_MinimumBiasHF0_AND_BptxAND** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_MinimumBiasHF0_AND_BptxAND_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_MinimumBiasHF0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_Mu10er2p3_Jet32er2p3_dR_Max0p4_DoubleJet32er2p3_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu10er2p3_Jet32er2p3_dR_Max0p4_DoubleJet32er2p3_dEta_Max1p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_Mu12_HTT150er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu12_HTT150er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu12er2p3_Jet40er2p3_dR_Max0p4_DoubleJet40er2p3_dEta_Max1p6** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu12er2p3_Jet40er2p3_dR_Max0p4_DoubleJet40er2p3_dEta_Max1p6_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu14_HTT150er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu14_HTT150er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu18er2p1_Tau24er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu18er2p1_Tau24er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu18er2p1_Tau26er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu18er2p1_Tau26er2p1_Jet55** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu18er2p1_Tau26er2p1_Jet55_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu18er2p1_Tau26er2p1_Jet70** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu18er2p1_Tau26er2p1_Jet70_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu18er2p1_Tau26er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu20_EG10er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu20_EG10er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu22er2p1_IsoTau30er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu22er2p1_IsoTau30er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_Mu22er2p1_IsoTau32er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu22er2p1_IsoTau32er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu22er2p1_IsoTau34er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu22er2p1_IsoTau34er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu22er2p1_IsoTau40er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu22er2p1_IsoTau40er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_Mu22er2p1_Tau70er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu22er2p1_Tau70er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_Mu3_Jet120er2p5_dR_Max0p4** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu3_Jet120er2p5_dR_Max0p4_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu3_Jet16er2p5_dR_Max0p4** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu3_Jet16er2p5_dR_Max0p4_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_Mu3_Jet30er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu3_Jet30er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_Mu3_Jet60er2p5_dR_Max0p4** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu3_Jet60er2p5_dR_Max0p4_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_Mu3er1p5_Jet100er2p5_ETMHF30** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu3er1p5_Jet100er2p5_ETMHF30_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_Mu3er1p5_Jet100er2p5_ETMHF40** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu3er1p5_Jet100er2p5_ETMHF40_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu3er1p5_Jet100er2p5_ETMHF50** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu3er1p5_Jet100er2p5_ETMHF50_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu5_EG23er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu5_EG23er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_Mu5_LooseIsoEG20er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu5_LooseIsoEG20er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_Mu6_DoubleEG10er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_Mu6_DoubleEG10er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_Mu6_DoubleEG12er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu6_DoubleEG12er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu6_DoubleEG15er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu6_DoubleEG15er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu6_DoubleEG17er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu6_DoubleEG17er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu6_HTT240er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu6_HTT240er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu6_HTT250er** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_Mu6_HTT250er_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_Mu7_EG20er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_Mu7_EG20er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_Mu7_EG23er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_Mu7_EG23er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_Mu7_LooseIsoEG20er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_Mu7_LooseIsoEG20er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_Mu7_LooseIsoEG23er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_Mu7_LooseIsoEG23er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_NotBptxOR** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_NotBptxOR_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_QuadJet60er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_QuadJet60er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_QuadJet_95_75_65_20_DoubleJet_75_65_er2p5_Jet20_FWD3p0** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_QuadJet_95_75_65_20_DoubleJet_75_65_er2p5_Jet20_FWD3p0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_QuadMu0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_QuadMu0_OQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_QuadMu0_OQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_QuadMu0_SQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_QuadMu0_SQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_QuadMu0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SecondBunchInTrain** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SecondBunchInTrain_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SecondLastBunchInTrain** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SecondLastBunchInTrain_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleEG10er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_SingleEG10er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_SingleEG15er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_SingleEG15er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_SingleEG26er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleEG26er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleEG28_FWD2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleEG28_FWD2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleEG28er1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleEG28er1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleEG28er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleEG28er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleEG28er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleEG28er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleEG34er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleEG34er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleEG36er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_SingleEG36er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG38er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_SingleEG38er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG40er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_SingleEG40er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG42er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_SingleEG42er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG45er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_SingleEG45er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG50** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleEG50_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleEG60** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_SingleEG60_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_SingleEG8er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleEG8er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG24er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG24er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG26er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG26er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG26er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG26er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG28_FWD2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG28_FWD2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG28er1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_SingleIsoEG28er1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_SingleIsoEG28er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG28er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG28er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG28er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleIsoEG30er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG30er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG30er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.3%|
| **L1_SingleIsoEG30er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.3%|
| **L1_SingleIsoEG32er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG32er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG32er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.3%|
| **L1_SingleIsoEG32er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.3%|
| **L1_SingleIsoEG34er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.2| 0.2| 0.4%|
| **L1_SingleIsoEG34er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.2| 0.2| 0.4%|
| **L1_SingleJet10erHE** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet10erHE_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet120** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet120_FWD2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet120_FWD2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet120_FWD3p0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet120_FWD3p0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet120_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet120er1p3** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet120er1p3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet120er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet120er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet12erHE** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet12erHE_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet140er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet140er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet160er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet160er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet180** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_SingleJet180_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_SingleJet180er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_SingleJet180er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_SingleJet200** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_SingleJet200_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_SingleJet20er2p5_NotBptxOR** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet20er2p5_NotBptxOR_3BX** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet20er2p5_NotBptxOR_3BX_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet20er2p5_NotBptxOR_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet35** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet35_FWD2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet35_FWD2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet35_FWD3p0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet35_FWD3p0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet35_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet35er1p3** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet35er1p3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet35er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet35er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet43er2p5_NotBptxOR_3BX** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet43er2p5_NotBptxOR_3BX_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet46er2p5_NotBptxOR_3BX** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet46er2p5_NotBptxOR_3BX_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet60** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet60_FWD2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet60_FWD2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet60_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet8erHE** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet8erHE_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet90** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet90_FWD2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleJet90_FWD2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleJet90_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG26er1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG26er1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG26er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG26er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG28_FWD2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG28_FWD2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG28er1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG28er1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG28er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG28er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG28er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG28er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG30er1p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG30er1p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG30er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleLooseIsoEG30er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_DQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_DQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_EMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_EMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_OMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_OMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_SQ13_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_SQ13_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_SQ14_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_SQ14_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_SQ15_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_SQ15_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt10** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt10_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt10_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt10_EMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt10_EMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt10_OMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt10_OMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt10_SQ14_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt10_SQ14_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt10_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt15_SQ14_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt15_SQ14_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt20_SQ14_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt20_SQ14_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt25_SQ14_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu0_Upt25_SQ14_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu10_SQ14_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu10_SQ14_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu11_SQ14_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu11_SQ14_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu12_DQ_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu12_DQ_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu12_DQ_EMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu12_DQ_EMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu12_DQ_OMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu12_DQ_OMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu15_DQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu15_DQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu18** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu18_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu20** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu20_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu22** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu22_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu22_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu22_DQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu22_DQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu22_EMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu22_EMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu22_OMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu22_OMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu22_OQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu22_OQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu22_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu25** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu25_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu3** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu5_SQ14_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu5_SQ14_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu6_SQ14_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu6_SQ14_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu7** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu7_DQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu7_DQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu7_SQ14_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu7_SQ14_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu7_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu8_SQ14_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu8_SQ14_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMu9_SQ14_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMu9_SQ14_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuCosmics** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuCosmics_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuCosmics_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuCosmics_EMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuCosmics_EMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuCosmics_OMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuCosmics_OMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuCosmics_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_BMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_BMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_EMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_EMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_NotBptxOR** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_NotBptxOR_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_OMTF** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_OMTF_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_er1p1_NotBptxOR_3BX** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_er1p1_NotBptxOR_3BX_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_er1p4_NotBptxOR_3BX** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_er1p4_NotBptxOR_3BX_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuOpen_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuShower_Nominal** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuShower_Nominal_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleMuShower_Tight** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_SingleMuShower_Tight_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_SingleTau120er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_SingleTau120er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_SingleTau130er2p1** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_SingleTau130er2p1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_TOTEM_1** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TOTEM_1_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TOTEM_2** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TOTEM_2_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TOTEM_3** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TOTEM_3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TOTEM_4** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TOTEM_4_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleEG_18_17_8_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_TripleEG_18_17_8_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_TripleEG_18_18_12_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_TripleEG_18_18_12_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_TripleJet_100_80_70_DoubleJet_80_70_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_TripleJet_100_80_70_DoubleJet_80_70_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_TripleJet_105_85_75_DoubleJet_85_75_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_TripleJet_105_85_75_DoubleJet_85_75_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_TripleJet_95_75_65_DoubleJet_75_65_er2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_TripleJet_95_75_65_DoubleJet_75_65_er2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_TripleMu0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu0_OQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu0_OQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu0_SQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu0_SQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu3** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu3_SQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu3_SQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_3SQ_2p5SQ_0** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_3SQ_2p5SQ_0_Mass_Max12** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_3SQ_2p5SQ_0_Mass_Max12_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_3SQ_2p5SQ_0_OS_Mass_Max12** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_3SQ_2p5SQ_0_OS_Mass_Max12_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_3SQ_2p5SQ_0_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_4SQ_2p5SQ_0_OS_Mass_Max12** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_4SQ_2p5SQ_0_OS_Mass_Max12_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5SQ_3SQ_0OQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5SQ_3SQ_0OQ_DoubleMu_5_3_SQ_OS_Mass_Max9** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5SQ_3SQ_0OQ_DoubleMu_5_3_SQ_OS_Mass_Max9_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5SQ_3SQ_0OQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5SQ_3SQ_0_DoubleMu_5_3_SQ_OS_Mass_Max9** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5SQ_3SQ_0_DoubleMu_5_3_SQ_OS_Mass_Max9_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5_3_3** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5_3_3_SQ** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5_3_3_SQ_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5_3_3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5_3p5_2p5** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5_3p5_2p5_DoubleMu_5_2p5_OS_Mass_5to17** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5_3p5_2p5_DoubleMu_5_2p5_OS_Mass_5to17_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5_3p5_2p5_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5_4_2p5_DoubleMu_5_2p5_OS_Mass_5to17** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5_4_2p5_DoubleMu_5_2p5_OS_Mass_5to17_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5_5_3** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TripleMu_5_5_3_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_TwoMuShower_Loose** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_TwoMuShower_Loose_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_UnpairedBunchBptxMinus** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_UnpairedBunchBptxMinus_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_UnpairedBunchBptxPlus** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_UnpairedBunchBptxPlus_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_UnprefireableEvent_FirstBxInTrain** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.2%|
| **L1_UnprefireableEvent_FirstBxInTrain_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.2%|
| **L1_UnprefireableEvent_TriggerRules** | Bool_t| Trigger/flag bit (process: PAT) | 0.1| 0.1| 0.1%|
| **L1_UnprefireableEvent_TriggerRules_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.1| 0.1| 0.1%|
| **L1_ZeroBias** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_ZeroBias_copy** | Bool_t| Trigger/flag bit (process: PAT) | 0.0| 0.0| 0.1%|
| **L1_ZeroBias_copy_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|
| **L1_ZeroBias_pRECO** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 0.1%|

### L1Reco
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **L1Reco_step** | Bool_t| Trigger/flag bit (process: RECO) | 0.0| 0.0| 100.0%|

### LowPtElectron
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **LowPtElectron_ID** | Float_t| ID, BDT (raw) score | 3.5| 4.5| 6.6%|
| **LowPtElectron_charge** | Int_t| electric charge | 0.8| 1.0| 1.5%|
| **LowPtElectron_convVeto** | Bool_t| pass conversion veto | 0.6| 0.8| 1.2%|
| **LowPtElectron_convVtxRadius** | Float_t| conversion vertex radius (cm) | 0.8| 1.0| 1.5%|
| **LowPtElectron_convWP** | UChar_t| conversion flag bit map: 1=Veto, 2=Loose, 3=Tight | 0.6| 0.8| 1.2%|
| **LowPtElectron_deltaEtaSC** | Float_t| delta eta (SC,ele) with sign | 2.3| 3.0| 4.4%|
| **LowPtElectron_dxy** | Float_t| dxy (with sign) wrt first PV, in cm | 2.3| 3.0| 4.4%|
| **LowPtElectron_dxyErr** | Float_t| dxy uncertainty, in cm | 1.6| 2.1| 3.1%|
| **LowPtElectron_dz** | Float_t| dz (with sign) wrt first PV, in cm | 2.4| 3.1| 4.5%|
| **LowPtElectron_dzErr** | Float_t| dz uncertainty, in cm | 1.6| 2.1| 3.1%|
| **LowPtElectron_eInvMinusPInv** | Float_t| 1/E_SC - 1/p_trk | 2.3| 3.0| 4.4%|
| **LowPtElectron_electronIdx** | Short_t(index to Electron)| index of the overlapping PF electron (-1 if none) | 0.8| 1.0| 1.4%|
| **LowPtElectron_energyErr** | Float_t| energy error of the cluster-track combination | 1.7| 2.3| 3.3%|
| **LowPtElectron_eta** | Float_t| eta | 2.5| 3.2| 4.8%|
| **LowPtElectron_hoe** | Float_t| H over E | 1.8| 2.4| 3.5%|
| **LowPtElectron_lostHits** | UChar_t| number of missing inner hits | 0.7| 0.9| 1.4%|
| **LowPtElectron_mass** | Float_t| mass | 1.6| 2.1| 3.1%|
| **LowPtElectron_miniPFRelIso_all** | Float_t| mini PF relative isolation, total (with scaled rho*EA PU corrections) | 2.5| 3.2| 4.8%|
| **LowPtElectron_miniPFRelIso_chg** | Float_t| mini PF relative isolation, charged component | 2.1| 2.7| 3.9%|
| **LowPtElectron_pdgId** | Int_t| PDG code assigned by the event reconstruction (not by MC truth) | 0.8| 1.0| 1.5%|
| **LowPtElectron_phi** | Float_t| phi | 2.5| 3.2| 4.7%|
| **LowPtElectron_photonIdx** | Short_t(index to Photon)| index of the first associated photon (-1 if none) | 0.6| 0.7| 1.1%|
| **LowPtElectron_pt** | Float_t| pt | 3.4| 4.4| 6.5%|
| **LowPtElectron_ptbiased** | Float_t| ElectronSeed, pT- and dxy- dependent BDT (raw) score | 3.0| 4.0| 5.8%|
| **LowPtElectron_r9** | Float_t| R9 of the SC, calculated with full 5x5 region | 2.2| 2.8| 4.2%|
| **LowPtElectron_scEtOverPt** | Float_t| (SC energy)/pt-1 | 2.0| 2.5| 3.7%|
| **LowPtElectron_sieie** | Float_t| sigma_IetaIeta of the SC, calculated with full 5x5 region | 1.9| 2.4| 3.6%|
| **LowPtElectron_unbiased** | Float_t| ElectronSeed, pT- and dxy- agnostic BDT (raw) score | 3.2| 4.1| 6.1%|
| **nLowPtElectron** | Int_t| slimmedLowPtElectrons after basic selection (pt > 1. && electronID("ID") > -0.25) | 0.3| 0.4| 0.6%|

### Muon
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Muon_IPx** | Float_t| x coordinate of impact parameter vector | 0.5| 1.5| 0.9%|
| **Muon_IPy** | Float_t| y coordinate of impact parameter vector | 0.5| 1.5| 0.9%|
| **Muon_IPz** | Float_t| z coordinate of impact parameter vector | 0.5| 1.5| 0.9%|
| **Muon_VXBS_Cov00** | Float_t| 0, 0 element of the VXBS Covariance matrix | 1.5| 3.9| 2.3%|
| **Muon_VXBS_Cov03** | Float_t| 0, 3 element of the VXBS Covariance matrix | 1.5| 4.0| 2.3%|
| **Muon_VXBS_Cov33** | Float_t| 3, 3 element of the VXBS Covariance matrix | 1.4| 3.9| 2.3%|
| **Muon_bestTrackType** | UChar_t| Type of track used (1=inner, 2=STA, 3=global, 4=TPFMS, 5=Picky, 6=DYT) | 0.5| 1.2| 0.7%|
| **Muon_bsConstrainedChi2** | Float_t| chi2 of beamspot constraint | 1.0| 2.8| 1.6%|
| **Muon_bsConstrainedPt** | Float_t| pT with beamspot constraint | 1.7| 4.6| 2.7%|
| **Muon_bsConstrainedPtErr** | Float_t| pT error with beamspot constraint | 0.9| 2.6| 1.5%|
| **Muon_charge** | Int_t| electric charge | 0.5| 1.4| 0.8%|
| **Muon_dxy** | Float_t| dxy (with sign) wrt first PV, in cm | 1.3| 3.5| 2.1%|
| **Muon_dxyErr** | Float_t| dxy uncertainty, in cm | 0.9| 2.4| 1.4%|
| **Muon_dxybs** | Float_t| dxy (with sign) wrt the beam spot, in cm | 1.3| 3.5| 2.1%|
| **Muon_dxybsErr** | Float_t| dxy uncertainty wrt the beam spot, in cm | 0.9| 2.4| 1.4%|
| **Muon_dz** | Float_t| dz (with sign) wrt first PV, in cm | 1.3| 3.6| 2.1%|
| **Muon_dzErr** | Float_t| dz uncertainty, in cm | 0.9| 2.5| 1.5%|
| **Muon_eta** | Float_t| eta | 1.5| 4.0| 2.4%|
| **Muon_fsrPhotonIdx** | Short_t(index to Fsrphoton)| Index of the lowest-dR/ET2 among associated FSR photons | 0.4| 1.2| 0.7%|
| **Muon_highPtId** | UChar_t| high-pT cut-based ID (1 = tracker high pT, 2 = global high pT, which includes tracker high pT) | 0.4| 1.2| 0.7%|
| **Muon_highPurity** | Bool_t| inner track is high purity | 0.4| 1.2| 0.7%|
| **Muon_inTimeMuon** | Bool_t| inTimeMuon ID | 0.4| 1.2| 0.7%|
| **Muon_ip3d** | Float_t| 3D impact parameter wrt first PV, in cm | 1.2| 3.4| 2.0%|
| **Muon_ipLengthSig** | Float_t| significance of impact parameter | 0.5| 1.5| 0.9%|
| **Muon_isGlobal** | Bool_t| muon is global muon | 0.5| 1.3| 0.7%|
| **Muon_isPFcand** | Bool_t| muon is PF candidate | 0.5| 1.3| 0.7%|
| **Muon_isStandalone** | Bool_t| muon is a standalone muon | 0.5| 1.3| 0.7%|
| **Muon_isTracker** | Bool_t| muon is tracker muon | 0.4| 1.2| 0.7%|
| **Muon_jetDF** | Float_t| value of the DEEPJET b tagging algorithm discriminator of the associated jet (0 if none) | 0.7| 1.9| 1.1%|
| **Muon_jetIdx** | Short_t(index to Jet)| index of the associated jet (-1 if none) | 0.5| 1.4| 0.8%|
| **Muon_jetNDauCharged** | UChar_t| number of charged daughters of the closest jet | 0.5| 1.4| 0.8%|
| **Muon_jetPtRelv2** | Float_t| Relative momentum of the lepton with respect to the closest jet after subtracting the lepton | 0.7| 2.0| 1.1%|
| **Muon_jetRelIso** | Float_t| Relative isolation in matched jet (1/ptRatio-1), -1 if none | 0.7| 2.0| 1.2%|
| **Muon_looseId** | Bool_t| muon is loose muon | 0.5| 1.3| 0.7%|
| **Muon_mass** | Float_t| mass | 0.5| 1.4| 0.8%|
| **Muon_mediumId** | Bool_t| cut-based ID, medium WP | 0.5| 1.2| 0.7%|
| **Muon_mediumPromptId** | Bool_t| cut-based ID, medium prompt WP | 0.4| 1.2| 0.7%|
| **Muon_miniIsoId** | UChar_t| MiniIso ID from miniAOD selector (1=MiniIsoLoose, 2=MiniIsoMedium, 3=MiniIsoTight, 4=MiniIsoVeryTight) | 0.5| 1.4| 0.8%|
| **Muon_miniPFRelIso_all** | Float_t| mini PF relative isolation, total (with scaled rho*EA PU corrections) | 1.4| 3.8| 2.2%|
| **Muon_miniPFRelIso_chg** | Float_t| mini PF relative isolation, charged component | 1.1| 3.0| 1.8%|
| **Muon_multiIsoId** | UChar_t| MultiIsoId from miniAOD selector (1=MultiIsoLoose, 2=MultiIsoMedium) | 0.5| 1.2| 0.7%|
| **Muon_mvaLowPt** | Float_t| Low pt muon ID score | 1.0| 2.9| 1.7%|
| **Muon_mvaMuID** | Float_t| MVA-based ID score | 0.9| 2.6| 1.5%|
| **Muon_mvaMuID_WP** | UChar_t| MVA-based ID selector WPs (1=MVAIDwpMedium,2=MVAIDwpTight) | 0.5| 1.4| 0.8%|
| **Muon_nStations** | UChar_t| number of matched stations with default arbitration (segment & track) | 0.5| 1.4| 0.8%|
| **Muon_nTrackerLayers** | UChar_t| number of layers in the tracker | 0.6| 1.6| 0.9%|
| **Muon_pdgId** | Int_t| PDG code assigned by the event reconstruction (not by MC truth) | 0.5| 1.4| 0.8%|
| **Muon_pfIsoId** | UChar_t| PFIso ID from miniAOD selector (1=PFIsoVeryLoose, 2=PFIsoLoose, 3=PFIsoMedium, 4=PFIsoTight, 5=PFIsoVeryTight, 6=PFIsoVeryVeryTight) | 0.5| 1.4| 0.8%|
| **Muon_pfRelIso03_all** | Float_t| PF relative isolation dR=0.3, total (deltaBeta corrections) | 1.5| 4.0| 2.4%|
| **Muon_pfRelIso03_chg** | Float_t| PF relative isolation dR=0.3, charged component | 1.3| 3.6| 2.1%|
| **Muon_pfRelIso04_all** | Float_t| PF relative isolation dR=0.4, total (deltaBeta corrections) | 1.6| 4.3| 2.5%|
| **Muon_phi** | Float_t| phi | 1.5| 4.0| 2.4%|
| **Muon_pnScore_heavy** | Float_t| PNet muon ID score for lepton from B or D hadrons | 1.4| 3.8| 2.2%|
| **Muon_pnScore_light** | Float_t| PNet muon ID score for lepton from hadrons w/o b or c quarks OR w/o generator matching | 1.0| 2.7| 1.6%|
| **Muon_pnScore_prompt** | Float_t| PNet muon ID score for lepton from W/Z/H bosons | 1.1| 3.1| 1.8%|
| **Muon_pnScore_tau** | Float_t| PNet muon ID score for decay of tau to light leptons (mu) | 1.4| 3.8| 2.2%|
| **Muon_promptMVA** | Float_t| Prompt MVA lepton ID score. Corresponds to the previous mvaTTH | 1.2| 3.2| 1.9%|
| **Muon_pt** | Float_t| pt | 1.7| 4.6| 2.7%|
| **Muon_ptErr** | Float_t| ptError of the muon track | 0.9| 2.6| 1.5%|
| **Muon_puppiIsoId** | UChar_t| PuppiIsoId from miniAOD selector (1=Loose, 2=Medium, 3=Tight) | 0.5| 1.3| 0.8%|
| **Muon_segmentComp** | Float_t| muon segment compatibility | 1.2| 3.3| 1.9%|
| **Muon_sip3d** | Float_t| 3D impact parameter significance wrt first PV | 1.3| 3.4| 2.0%|
| **Muon_softId** | Bool_t| soft cut-based ID | 0.5| 1.2| 0.7%|
| **Muon_softMva** | Float_t| soft MVA ID score | 0.7| 1.8| 1.1%|
| **Muon_softMvaId** | Bool_t| soft MVA ID | 0.4| 1.2| 0.7%|
| **Muon_softMvaRun3** | Float_t| soft MVA Run3 ID score | 0.9| 2.5| 1.5%|
| **Muon_svIdx** | Short_t(index to Sv)| index of matching secondary vertex | 0.5| 1.2| 0.7%|
| **Muon_tightCharge** | UChar_t| Tight charge criterion using pterr/pt of muonBestTrack (0:fail, 2:pass) | 0.4| 1.2| 0.7%|
| **Muon_tightId** | Bool_t| cut-based ID, tight WP | 0.4| 1.2| 0.7%|
| **Muon_tkIsoId** | UChar_t| TkIso ID (1=TkIsoLoose, 2=TkIsoTight) | 0.5| 1.3| 0.8%|
| **Muon_tkRelIso** | Float_t| Tracker-based relative isolation dR=0.3 for highPt, trkIso/pt | 0.9| 2.5| 1.4%|
| **Muon_triggerIdLoose** | Bool_t| TriggerIdLoose ID | 0.5| 1.3| 0.7%|
| **Muon_tuneP_charge** | Float_t| tunePMuonBestTrack() charge | 0.5| 1.4| 0.8%|
| **Muon_tuneP_pterr** | Float_t| pTerr from tunePMuonBestTrack | 0.9| 2.6| 1.5%|
| **Muon_tunepRelPt** | Float_t| TuneP relative pt, tunePpt/pt | 0.5| 1.3| 0.8%|
| **nMuon** | Int_t| slimmedMuons after basic selection (pt > 15 \|\| (pt > 3 && (passed("CutBasedIdLoose") \|\| passed("SoftCutBasedId") \|\| passed("SoftMvaId") \|\| passed("CutBasedIdGlobalHighPt") \|\| passed("CutBasedIdTrkHighPt")))) | 0.3| 0.7| 0.4%|

### OtherPV
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **OtherPV_score** | Float_t| scores of other primary vertices, excluding the main PV | 5.1| 1.7| 46.6%|
| **OtherPV_z** | Float_t| Z position of other primary vertices, excluding the main PV | 5.8| 1.9| 53.0%|
| **nOtherPV** | Int_t|  | 0.0| 0.0| 0.4%|

### PFCand
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **PFCand_eta** | Float_t| eta | 8.5| 2.0| 29.0%|
| **PFCand_mass** | Float_t| Puppi-weighted mass | 2.3| 0.6| 8.0%|
| **PFCand_pdgId** | Int_t| PF candidate type (+/-211 = ChgHad, 130 = NeuHad, 22 = Photon, +/-11 = Electron, +/-13 = Muon, 1 = HFHad, 2 = HFEM) | 1.2| 0.3| 4.2%|
| **PFCand_phi** | Float_t| phi | 9.1| 2.2| 30.7%|
| **PFCand_pt** | Float_t| Puppi-weighted pt | 8.0| 1.9| 27.3%|
| **nPFCand** | Int_t| PF candidate constituents of AK8 puppi jets (FatJet) with \|eta\| <= 2.5 | 0.2| 0.1| 0.8%|

### PFMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **PFMET_covXX** | Float_t| xx element of met covariance matrix | 1.4| 1.4| 5.9%|
| **PFMET_covXY** | Float_t| xy element of met covariance matrix | 1.7| 1.7| 7.5%|
| **PFMET_covYY** | Float_t| yy element of met covariance matrix | 1.4| 1.4| 5.9%|
| **PFMET_phi** | Float_t| phi | 2.4| 2.4| 10.4%|
| **PFMET_phiUnclusteredDown** | Float_t| Unclustered down phi | 2.0| 2.0| 8.7%|
| **PFMET_phiUnclusteredUp** | Float_t| Unclustered up phi | 2.0| 2.0| 8.8%|
| **PFMET_pt** | Float_t| pt | 3.5| 3.5| 15.2%|
| **PFMET_ptUnclusteredDown** | Float_t| Unclustered down pt | 1.8| 1.8| 7.9%|
| **PFMET_ptUnclusteredUp** | Float_t| Unclustered up pt | 1.8| 1.8| 7.9%|
| **PFMET_significance** | Float_t| MET significance | 1.9| 1.9| 8.4%|
| **PFMET_sumEt** | Float_t| scalar sum of Et | 1.6| 1.6| 6.7%|
| **PFMET_sumPtUnclustered** | Float_t| sumPt used for MET significance | 1.5| 1.5| 6.6%|

### PPSLocalTrack
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **PPSLocalTrack_decRPId** | Int_t| local track detector dec id | 1.7| 0.4| 6.0%|
| **PPSLocalTrack_multiRPProtonIdx** | Int_t(index to Multirpproton)| local track - proton correspondence | 0.9| 0.2| 3.1%|
| **PPSLocalTrack_rpType** | Int_t| strip=3, pixel=4, diamond=5, timing=6 | 0.8| 0.2| 2.9%|
| **PPSLocalTrack_singleRPProtonIdx** | Int_t(index to Singlerpproton)| local track - proton correspondence | 1.4| 0.3| 5.0%|
| **PPSLocalTrack_time** | Float_t| local track time | 0.8| 0.2| 3.1%|
| **PPSLocalTrack_timeUnc** | Float_t| local track time uncertainty | 0.8| 0.2| 3.0%|
| **PPSLocalTrack_x** | Float_t| local track x | 10.7| 2.6| 38.5%|
| **PPSLocalTrack_y** | Float_t| local track y | 10.2| 2.5| 36.8%|
| **nPPSLocalTrack** | Int_t| ppsLocalTrack variables | 0.5| 0.1| 1.7%|

### PV
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **PV_chi2** | Float_t| main primary vertex reduced chi2 | 1.2| 1.2| 7.1%|
| **PV_ndof** | Float_t| main primary vertex number of degree of freedom | 1.4| 1.4| 8.7%|
| **PV_npvs** | UChar_t| total number of reconstructed primary vertices | 0.7| 0.7| 4.0%|
| **PV_npvsGood** | UChar_t| number of good reconstructed primary vertices. selection:!isFake && ndof > 4 && abs(z) <= 24 && position.Rho <= 2 | 0.7| 0.7| 4.0%|
| **PV_score** | Float_t| main primary vertex score, i.e. sum pt2 of clustered objects | 1.6| 1.6| 9.7%|
| **PV_sumpt2** | Float_t| sum pt2 of pf charged candidates for the main primary vertex | 2.0| 2.0| 12.0%|
| **PV_sumpx** | Float_t| sum px of pf charged candidates for the main primary vertex | 2.1| 2.1| 12.6%|
| **PV_sumpy** | Float_t| sum py of pf charged candidates for the main primary vertex | 2.1| 2.1| 12.6%|
| **PV_x** | Float_t| main primary vertex position x coordinate | 1.1| 1.1| 6.5%|
| **PV_y** | Float_t| main primary vertex position y coordinate | 0.9| 0.9| 5.7%|
| **PV_z** | Float_t| main primary vertex position z coordinate | 2.8| 2.8| 17.0%|

### PVBS
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **PVBS_chi2** | Float_t| reduced chi2, i.e. chi2/ndof | 1.8| 1.8| 7.7%|
| **PVBS_cov00** | Float_t| vertex covariance (0,0) | 2.3| 2.3| 9.9%|
| **PVBS_cov10** | Float_t| vertex covariance (1,0) | 2.7| 2.7| 11.5%|
| **PVBS_cov11** | Float_t| vertex covariance (1,1) | 2.3| 2.3| 9.9%|
| **PVBS_cov20** | Float_t| vertex covariance (2,0) | 2.7| 2.7| 11.5%|
| **PVBS_cov21** | Float_t| vertex covariance (2,1) | 2.7| 2.7| 11.5%|
| **PVBS_cov22** | Float_t| vertex covariance (2,2) | 2.5| 2.5| 10.7%|
| **PVBS_x** | Float_t| position x coordinate, in cm | 1.6| 1.6| 6.6%|
| **PVBS_y** | Float_t| position y coordinate, in cm | 1.4| 1.4| 5.9%|
| **PVBS_z** | Float_t| position z coordinate, in cm | 3.5| 3.5| 14.7%|
| **nPVBS** | Int_t| main primary vertex with beam-spot | 0.0| 0.0| 0.2%|

### Photon
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Photon_cutBased** | UChar_t| cut-based ID bitmap, RunIIIWinter22V1: fail ==0, loose >=1 , medium >=2, tight >=3 | 1.1| 0.7| 0.8%|
| **Photon_ecalPFClusterIso** | Float_t| sum pt of ecal clusters, vetoing clusters part of photon | 3.4| 2.3| 2.5%|
| **Photon_electronIdx** | Short_t(index to Electron)| index of the associated electron (-1 if none) | 1.0| 0.7| 0.8%|
| **Photon_electronVeto** | Bool_t| pass electron veto | 0.9| 0.6| 0.6%|
| **Photon_energyErr** | Float_t| energy error of the cluster from regression | 3.7| 2.5| 2.7%|
| **Photon_energyRaw** | Float_t| raw energy of photon supercluster | 3.5| 2.4| 2.6%|
| **Photon_esEffSigmaRR** | Float_t| preshower sigmaRR | 2.5| 1.7| 1.9%|
| **Photon_esEnergyOverRawE** | Float_t| ratio of preshower energy to raw supercluster energy | 2.6| 1.7| 1.9%|
| **Photon_eta** | Float_t| eta | 4.3| 2.9| 3.1%|
| **Photon_etaWidth** | Float_t| Width of the photon supercluster in eta | 3.4| 2.3| 2.5%|
| **Photon_haloTaggerMVAVal** | Float_t| Value of MVA based BDT based  beam halo tagger in the Ecal endcap (valid for pT > 200 GeV) | 1.6| 1.1| 1.1%|
| **Photon_hasConversionTracks** | Bool_t| Variable specifying if photon has associated conversion tracks (one-legged or two-legged) | 0.8| 0.6| 0.6%|
| **Photon_hcalPFClusterIso** | Float_t| sum pt of hcal clusters, vetoing clusters part of photon | 3.5| 2.4| 2.6%|
| **Photon_hoe** | Float_t| H over E | 3.5| 2.4| 2.6%|
| **Photon_hoe_PUcorr** | Float_t| PU corrected H/E (cone-based with quadraticEA*rho*rho + linearEA*rho Winter22V1 corrections) | 1.8| 1.2| 1.3%|
| **Photon_hoe_Tower** | Float_t| H over E Tower based calculation | 2.3| 1.6| 1.7%|
| **Photon_isScEtaEB** | Bool_t| is supercluster eta within barrel acceptance | 0.9| 0.6| 0.6%|
| **Photon_isScEtaEE** | Bool_t| is supercluster eta within endcap acceptance | 0.9| 0.6| 0.6%|
| **Photon_jetIdx** | Short_t(index to Jet)| index of the associated jet (-1 if none) | 1.2| 0.8| 0.9%|
| **Photon_mvaID** | Float_t| MVA ID score, Winter22V1 | 3.3| 2.3| 2.5%|
| **Photon_mvaID_WP80** | Bool_t| MVA ID WP80, Winter22V1 | 0.9| 0.6| 0.6%|
| **Photon_mvaID_WP90** | Bool_t| MVA ID WP90, Winter22V1 | 0.9| 0.6| 0.6%|
| **Photon_pfChargedIso** | Float_t| PF absolute isolation dR=0.3, charged component with dxy,dz match to PV | 3.2| 2.2| 2.4%|
| **Photon_pfChargedIsoPFPV** | Float_t| PF absolute isolation dR=0.3, charged component (PF PV only) | 4.7| 3.2| 3.5%|
| **Photon_pfChargedIsoWorstVtx** | Float_t| PF absolute isolation dR=0.3, charged component (Vertex with largest isolation) | 6.0| 4.1| 4.4%|
| **Photon_pfPhoIso03** | Float_t| PF absolute isolation dR=0.3, photon component (uncorrected) | 5.2| 3.6| 3.8%|
| **Photon_pfRelIso03_all_quadratic** | Float_t| PF relative isolation dR=0.3, total (with quadraticEA*rho*rho + linearEA*rho Winter22V1 corrections) | 4.9| 3.4| 3.6%|
| **Photon_pfRelIso03_chg_quadratic** | Float_t| PF relative isolation dR=0.3, charged hadron component (with quadraticEA*rho*rho + linearEA*rho Winter22V1 corrections) | 4.3| 2.9| 3.1%|
| **Photon_phi** | Float_t| phi | 4.3| 2.9| 3.1%|
| **Photon_phiWidth** | Float_t| Width of the photon supercluster in phi | 3.5| 2.4| 2.6%|
| **Photon_pixelSeed** | Bool_t| has pixel seed | 0.9| 0.6| 0.6%|
| **Photon_pt** | Float_t| pt | 5.9| 4.0| 4.3%|
| **Photon_r9** | Float_t| R9 of the supercluster, calculated with full 5x5 region | 3.0| 2.1| 2.2%|
| **Photon_s4** | Float_t| e2x2/e5x5 of the supercluster, calculated with full 5x5 region | 3.0| 2.0| 2.2%|
| **Photon_seedGain** | UChar_t| Gain of the seed crystal | 0.6| 0.4| 0.5%|
| **Photon_seediEtaOriX** | Short_t| iEta or iX of seed crystal. iEta is barrel-only, iX is endcap-only. iEta runs from -85 to +85, with no crystal at iEta=0. iX runs from 1 to 100. | 2.3| 1.6| 1.7%|
| **Photon_seediPhiOriY** | Short_t| iPhi or iY of seed crystal. iPhi is barrel-only, iY is endcap-only. iPhi runs from 1 to 360. iY runs from 1 to 100. | 2.5| 1.7| 1.8%|
| **Photon_sieie** | Float_t| sigma_IetaIeta of the supercluster, calculated with full 5x5 region | 3.2| 2.2| 2.4%|
| **Photon_sieip** | Float_t| sigma_IetaIphi of the supercluster, calculated with full 5x5 region | 3.9| 2.7| 2.9%|
| **Photon_sipip** | Float_t| sigmaIphiIphi of the supercluster | 3.3| 2.3| 2.4%|
| **Photon_superclusterEta** | Float_t| supercluster eta | 3.7| 2.5| 2.7%|
| **Photon_trkSumPtHollowConeDR03** | Float_t| Sum of track pT in a hollow cone of outer radius, inner radius | 3.3| 2.2| 2.4%|
| **Photon_trkSumPtSolidConeDR04** | Float_t| Sum of track pT in a cone of dR=0.4 | 3.5| 2.4| 2.5%|
| **Photon_vidNestedWPBitmap** | Int_t| RunIIIWinter22V1 VID compressed bitmap (MinPtCut,PhoSCEtaMultiRangeCut,PhoFull5x5SigmaIEtaIEtaCut,PhoGenericQuadraticRhoPtScaledCut,PhoGenericQuadraticRhoPtScaledCut,PhoGenericQuadraticRhoPtScaledCut,PhoGenericQuadraticRhoPtScaledCut), 2 bits per cut | 2.1| 1.4| 1.5%|
| **Photon_x_calo** | Float_t| photon supercluster position on calorimeter, x coordinate (cm) | 3.7| 2.5| 2.7%|
| **Photon_y_calo** | Float_t| photon supercluster position on calorimeter, y coordinate (cm) | 3.7| 2.5| 2.7%|
| **Photon_z_calo** | Float_t| photon supercluster position on calorimeter, z coordinate (cm) | 3.4| 2.3| 2.5%|
| **nPhoton** | Int_t| slimmedPhotons after basic selection (pt > 5 ) | 0.3| 0.2| 0.2%|

### Proton
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Proton_multiRP_arm** | UChar_t| 0 = sector45, 1 = sector56 | 0.1| 6.4| 0.6%|
| **Proton_multiRP_t** | Float_t| Mandelstam variable t | 0.2| 9.3| 0.8%|
| **Proton_multiRP_thetaX** | Float_t| theta x | 0.2| 9.5| 0.9%|
| **Proton_multiRP_thetaY** | Float_t| theta y | 0.2| 9.5| 0.9%|
| **Proton_multiRP_time** | Float_t| time | 0.2| 8.4| 0.8%|
| **Proton_multiRP_timeUnc** | Float_t| time uncertainty | 0.1| 7.6| 0.7%|
| **Proton_multiRP_xi** | Float_t| xi or dp/p | 0.2| 9.1| 0.8%|
| **Proton_singleRP_decRPId** | Short_t| Detector ID | 1.5| 81.4| 7.4%|
| **Proton_singleRP_thetaY** | Float_t| th y | 8.9| 471.7| 42.8%|
| **Proton_singleRP_xi** | Float_t| xi or dp/p | 8.7| 460.2| 41.8%|
| **nProton_multiRP** | Int_t| bon | 0.1| 4.4| 0.4%|
| **nProton_singleRP** | Int_t| bon | 0.5| 24.9| 2.3%|

### PuppiMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **PuppiMET_covXX** | Float_t| xx element of met covariance matrix | 1.6| 1.6| 6.5%|
| **PuppiMET_covXY** | Float_t| xy element of met covariance matrix | 1.7| 1.7| 7.0%|
| **PuppiMET_covYY** | Float_t| yy element of met covariance matrix | 1.6| 1.6| 6.5%|
| **PuppiMET_phi** | Float_t| phi | 2.4| 2.4| 10.0%|
| **PuppiMET_phiUnclusteredDown** | Float_t| Unclustered down phi | 2.0| 2.0| 8.3%|
| **PuppiMET_phiUnclusteredUp** | Float_t| Unclustered up phi | 2.0| 2.0| 8.3%|
| **PuppiMET_pt** | Float_t| pt | 3.6| 3.6| 14.9%|
| **PuppiMET_ptUnclusteredDown** | Float_t| Unclustered down pt | 1.9| 1.9| 7.7%|
| **PuppiMET_ptUnclusteredUp** | Float_t| Unclustered up pt | 1.8| 1.8| 7.7%|
| **PuppiMET_significance** | Float_t| MET significance | 2.0| 2.0| 8.3%|
| **PuppiMET_sumEt** | Float_t| scalar sum of Et | 1.8| 1.8| 7.3%|
| **PuppiMET_sumPtUnclustered** | Float_t| sumPt used for MET significance | 1.8| 1.8| 7.4%|

### RawPFMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **RawPFMET_phi** | Float_t| phi | 2.4| 2.4| 31.0%|
| **RawPFMET_pt** | Float_t| pt | 3.5| 3.5| 45.2%|
| **RawPFMET_sumEt** | Float_t| scalar sum of Et | 1.8| 1.8| 23.7%|

### RawPuppiMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **RawPuppiMET_phi** | Float_t| phi | 2.4| 2.4| 29.7%|
| **RawPuppiMET_pt** | Float_t| pt | 3.6| 3.6| 44.4%|
| **RawPuppiMET_sumEt** | Float_t| scalar sum of Et | 2.1| 2.1| 25.9%|

### Rho
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Rho_fixedGridRhoAll** | Float_t| rho from all PF Candidates, no foreground removal (for isolation of prompt photons) | 3.2| 3.2| 16.7%|
| **Rho_fixedGridRhoFastjetAll** | Float_t| rho from all PF Candidates, used e.g. for JECs | 3.2| 3.2| 16.4%|
| **Rho_fixedGridRhoFastjetCentral** | Float_t| rho from all PF Candidates for central region, used e.g. for JECs | 3.3| 3.3| 17.3%|
| **Rho_fixedGridRhoFastjetCentralCalo** | Float_t| rho from calo towers with \|eta\| < 2.5, used e.g. egamma PFCluster isolation | 3.0| 3.0| 15.7%|
| **Rho_fixedGridRhoFastjetCentralChargedPileUp** | Float_t| rho from charged PF Candidates for central region, used e.g. for JECs | 3.3| 3.3| 17.2%|
| **Rho_fixedGridRhoFastjetCentralNeutral** | Float_t| rho from neutral PF Candidates with \|eta\| < 2.5, used e.g. for rho corrections of some lepton isolations | 3.2| 3.2| 16.7%|

### SV
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SV_charge** | Short_t| sum of the charge of the SV tracks | 0.9| 1.0| 2.7%|
| **SV_chi2** | Float_t| reduced chi2, i.e. chi/ndof | 2.1| 2.3| 6.1%|
| **SV_dlen** | Float_t| decay length in cm | 2.4| 2.6| 6.8%|
| **SV_dlenSig** | Float_t| decay length significance | 2.3| 2.5| 6.6%|
| **SV_dxy** | Float_t| 2D decay length in cm | 2.4| 2.6| 6.8%|
| **SV_dxySig** | Float_t| 2D decay length significance | 2.3| 2.5| 6.6%|
| **SV_eta** | Float_t| eta | 2.8| 3.1| 8.0%|
| **SV_mass** | Float_t| mass | 2.3| 2.5| 6.5%|
| **SV_ndof** | Float_t| number of degrees of freedom | 1.7| 1.9| 4.9%|
| **SV_ntracks** | UChar_t| number of tracks | 0.8| 0.8| 2.2%|
| **SV_pAngle** | Float_t| pointing angle, i.e. acos(p_SV * (SV - PV)) | 1.5| 1.7| 4.4%|
| **SV_phi** | Float_t| phi | 2.8| 3.1| 8.0%|
| **SV_pt** | Float_t| pt | 2.3| 2.5| 6.6%|
| **SV_x** | Float_t| secondary vertex X position, in cm | 2.5| 2.8| 7.3%|
| **SV_y** | Float_t| secondary vertex Y position, in cm | 2.5| 2.8| 7.1%|
| **SV_z** | Float_t| secondary vertex Z position, in cm | 2.9| 3.2| 8.3%|
| **nSV** | Int_t| secondary vertices from IVF algorithm | 0.4| 0.4| 1.1%|

### SoftActivityJet
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJet_eta** | Float_t| eta | 10.1| 1.7| 32.0%|
| **SoftActivityJet_phi** | Float_t| phi | 9.9| 1.7| 31.4%|
| **SoftActivityJet_pt** | Float_t| pt | 11.5| 1.9| 36.2%|
| **nSoftActivityJet** | Int_t| jets clustered from charged candidates compatible with primary vertex (charge()!=0 && pvAssociationQuality()>=5 && vertexRef().key()==0) | 0.1| 0.0| 0.4%|

### SoftActivityJetHT
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJetHT** | Float_t| scalar sum of soft activity jet pt, pt>1 | 3.5| 3.5| 100.0%|

### SoftActivityJetHT10
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJetHT10** | Float_t| scalar sum of soft activity jet pt , pt >10 | 3.3| 3.3| 100.0%|

### SoftActivityJetHT2
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJetHT2** | Float_t| scalar sum of soft activity jet pt, pt >2 | 3.5| 3.5| 100.0%|

### SoftActivityJetHT5
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SoftActivityJetHT5** | Float_t| scalar sum of soft activity jet pt, pt>5 | 3.6| 3.6| 100.0%|

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

### SubJet
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **SubJet_UParTAK4RegPtRawCorr** | Float_t| UnifiedParT universal flavor-aware visible pT regression (no neutrinos), correction relative to raw jet pT | 1.2| 2.2| 4.5%|
| **SubJet_UParTAK4RegPtRawCorrNeutrino** | Float_t| UnifiedParT universal flavor-aware pT regression neutrino correction, relative to visible. Correction relative to raw jet pT | 1.2| 2.2| 4.5%|
| **SubJet_UParTAK4RegPtRawRes** | Float_t| UnifiedParT universal flavor-aware jet pT resolution estimator, (q84 - q16)/2 | 1.4| 2.5| 5.2%|
| **SubJet_UParTAK4V1RegPtRawCorr** | Float_t| UnifiedParT V1 universal flavor-aware visible pT regression (no neutrinos), correction relative to raw jet pT | 1.2| 2.2| 4.5%|
| **SubJet_UParTAK4V1RegPtRawCorrNeutrino** | Float_t| UnifiedParT V1 universal flavor-aware pT regression neutrino correction, relative to visible. Correction relative to raw jet pT | 1.2| 2.2| 4.5%|
| **SubJet_UParTAK4V1RegPtRawRes** | Float_t| UnifiedParT V1 universal flavor-aware jet pT resolution estimator, (q84 - q16)/2 | 1.4| 2.5| 5.2%|
| **SubJet_area** | Float_t| jet catchment area, for JECs | 1.0| 1.8| 3.7%|
| **SubJet_btagDeepFlavB** | Float_t| DeepJet b+bb+lepb tag discriminator | 1.5| 2.7| 5.6%|
| **SubJet_btagUParTAK4B** | Float_t| UnifiedParT b vs. udscg | 1.5| 2.7| 5.6%|
| **SubJet_eta** | Float_t| eta | 1.7| 3.1| 6.4%|
| **SubJet_mass** | Float_t| mass | 1.5| 2.8| 5.8%|
| **SubJet_n2b1** | Float_t| N2 with beta=1 | 1.2| 2.1| 4.4%|
| **SubJet_n3b1** | Float_t| N3 with beta=1 | 1.1| 2.1| 4.3%|
| **SubJet_phi** | Float_t| phi | 1.7| 3.1| 6.3%|
| **SubJet_pt** | Float_t| pt | 1.4| 2.6| 5.3%|
| **SubJet_rawFactor** | Float_t| 1 - Factor to get back to raw pT | 1.1| 2.0| 4.1%|
| **SubJet_tau1** | Float_t| Nsubjettiness (1 axis) | 1.4| 2.5| 5.2%|
| **SubJet_tau2** | Float_t| Nsubjettiness (2 axis) | 1.3| 2.4| 4.9%|
| **SubJet_tau3** | Float_t| Nsubjettiness (3 axis) | 1.2| 2.3| 4.7%|
| **SubJet_tau4** | Float_t| Nsubjettiness (4 axis) | 1.2| 2.2| 4.5%|
| **nSubJet** | Int_t| slimmedJetsAK8PFPuppiSoftDropPacked::SubJets, i.e. soft-drop subjets for ak8 fat jets for boosted analysis | 0.3| 0.5| 1.0%|

### Tau
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **Tau_IPx** | Float_t| x coordinate of impact parameter vector | 2.5| 3.1| 2.2%|
| **Tau_IPy** | Float_t| y coordinate of impact parameter vector | 2.5| 3.1| 2.2%|
| **Tau_IPz** | Float_t| z coordinate of impact parameter vector | 2.5| 3.1| 2.2%|
| **Tau_charge** | Short_t| electric charge | 0.7| 0.9| 0.6%|
| **Tau_chargedIso** | Float_t| charged isolation | 1.8| 2.3| 1.6%|
| **Tau_decayMode** | UChar_t| decayMode() | 0.9| 1.1| 0.8%|
| **Tau_decayModePNet** | Short_t| decay mode of the highest tau score of ParticleNet (CHS Jets) | 0.9| 1.1| 0.8%|
| **Tau_decayModeUParT** | Short_t| decay mode of the highest tau score of Unified ParT 2024 (PUPPI Jets) | 0.9| 1.1| 0.8%|
| **Tau_dxy** | Float_t| d_{xy} of lead track with respect to PV, in cm (with sign) | 2.4| 3.0| 2.1%|
| **Tau_dz** | Float_t| d_{z} of lead track with respect to PV, in cm (with sign) | 2.8| 3.4| 2.4%|
| **Tau_eleIdx** | Short_t(index to Ele)| index of first matching electron | 0.8| 1.0| 0.7%|
| **Tau_eta** | Float_t| eta | 2.6| 3.2| 2.2%|
| **Tau_hasRefitSV** | Bool_t| has SV refit using miniAOD quantities | 0.7| 0.8| 0.6%|
| **Tau_idAntiEleDeadECal** | Bool_t| Anti-electron dead-ECal discriminator | 0.7| 0.9| 0.6%|
| **Tau_idAntiMu** | UChar_t| Anti-muon discriminator V3: : 1 = Loose, 2 = Tight | 0.7| 0.9| 0.6%|
| **Tau_idDecayModeNewDMs** | Bool_t| (?isTauIDAvailable("decayModeFindingNewDMs")?tauID("decayModeFindingNewDMs"):-1) > 0 | 0.7| 0.9| 0.6%|
| **Tau_idDecayModeOldDMs** | Bool_t| (?isTauIDAvailable("decayModeFinding")?tauID("decayModeFinding"):-1) > 0 | 0.7| 0.9| 0.6%|
| **Tau_idDeepTau2018v2p5VSe** | UChar_t| byDeepTau2018v2p5VSe ID working points (deepTau2018v2p5): 1 = VVVLoose, 2 = VVLoose, 3 = VLoose, 4 = Loose, 5 = Medium, 6 = Tight, 7 = VTight, 8 = VVTight | 0.9| 1.1| 0.8%|
| **Tau_idDeepTau2018v2p5VSjet** | UChar_t| byDeepTau2018v2p5VSjet ID working points (deepTau2018v2p5): 1 = VVVLoose, 2 = VVLoose, 3 = VLoose, 4 = Loose, 5 = Medium, 6 = Tight, 7 = VTight, 8 = VVTight | 0.9| 1.1| 0.7%|
| **Tau_idDeepTau2018v2p5VSmu** | UChar_t| byDeepTau2018v2p5VSmu ID working points (deepTau2018v2p5): 1 = VLoose, 2 = Loose, 3 = Medium, 4 = Tight | 0.8| 1.0| 0.7%|
| **Tau_ipLengthSig** | Float_t| significance of impact parameter | 2.4| 3.0| 2.1%|
| **Tau_jetIdx** | Short_t(index to Jet)| index of the associated jet (-1 if none) | 0.9| 1.1| 0.8%|
| **Tau_leadTkDeltaEta** | Float_t| eta of the leading track, minus tau eta | 2.1| 2.6| 1.9%|
| **Tau_leadTkDeltaPhi** | Float_t| phi of the leading track, minus tau phi | 2.1| 2.6| 1.9%|
| **Tau_leadTkPtOverTauPt** | Float_t| pt of the leading track divided by tau pt | 2.0| 2.5| 1.8%|
| **Tau_mass** | Float_t| mass | 1.9| 2.4| 1.7%|
| **Tau_muIdx** | Short_t(index to Mu)| index of first matching muon | 0.6| 0.8| 0.5%|
| **Tau_nSVs** | UChar_t| number of secondary vertices in the tau | 0.6| 0.8| 0.6%|
| **Tau_neutralIso** | Float_t| neutral (photon) isolation | 1.5| 1.8| 1.3%|
| **Tau_phi** | Float_t| phi | 2.6| 3.2| 2.2%|
| **Tau_photonsOutsideSignalCone** | Float_t| sum of photons outside signal cone | 1.2| 1.5| 1.1%|
| **Tau_probDM0PNet** | Float_t| normalised probablity of decayMode 0, 1h+0pi0 (PNet 2023 - CHS Jets) | 2.2| 2.8| 1.9%|
| **Tau_probDM0UParT** | Float_t| normalised probablity of decayMode 0, 1h+0pi0 (Unified ParT 2024 - PUPPI Jets) | 2.2| 2.7| 1.9%|
| **Tau_probDM10PNet** | Float_t| normalised probablity of decayMode 10, 3h+0pi0 (PNet 2023 - CHS Jets) | 2.3| 2.9| 2.0%|
| **Tau_probDM10UParT** | Float_t| normalised probablity of decayMode 10, 3h+0pi0 (Unified ParT 2024 - PUPPI Jets) | 2.2| 2.7| 1.9%|
| **Tau_probDM11PNet** | Float_t| normalised probablity of decayMode 11, 3h+1pi0 (PNet 2023 - CHS Jets) | 2.4| 2.9| 2.1%|
| **Tau_probDM11UParT** | Float_t| normalised probablity of decayMode 11, 3h+1pi0 (Unified ParT 2024 - PUPPI Jets) | 2.2| 2.7| 1.9%|
| **Tau_probDM1PNet** | Float_t| normalised probablity of decayMode 1, 1h+1pi0 (PNet 2023 - CHS Jets) | 2.1| 2.6| 1.9%|
| **Tau_probDM1UParT** | Float_t| normalised probablity of decayMode 1, 1h+1pi0 (Unified ParT 2024 - PUPPI Jets) | 2.0| 2.5| 1.8%|
| **Tau_probDM2PNet** | Float_t| normalised probablity of decayMode 2, 1h+2pi0 (PNet 2023 - CHS Jets) | 2.2| 2.7| 1.9%|
| **Tau_probDM2UParT** | Float_t| normalised probablity of decayMode 2, 1h+2pi0 (Unified ParT 2024 - PUPPI Jets) | 2.1| 2.6| 1.8%|
| **Tau_pt** | Float_t| pt | 3.5| 4.3| 3.0%|
| **Tau_ptCorrPNet** | Float_t| pt correction (PNet 2023 - CHS Jets) | 1.8| 2.2| 1.5%|
| **Tau_ptCorrUParT** | Float_t| pt correction (Unified ParT 2024 - PUPPI Jets) | 1.8| 2.2| 1.6%|
| **Tau_puCorr** | Float_t| pileup correction | 1.9| 2.3| 1.7%|
| **Tau_qConfPNet** | Float_t| signed charge confidence (PNet 2023 - CHS Jets) | 2.2| 2.7| 1.9%|
| **Tau_qConfUParT** | Float_t| signed charge confidence (Unified ParT 2024 - PUPPI Jets) | 2.0| 2.5| 1.8%|
| **Tau_rawDeepTau2018v2p5VSe** | Float_t| byDeepTau2018v2p5VSe raw output discriminator (deepTau2018v2p5) | 2.0| 2.5| 1.7%|
| **Tau_rawDeepTau2018v2p5VSjet** | Float_t| byDeepTau2018v2p5VSjet raw output discriminator (deepTau2018v2p5) | 2.0| 2.4| 1.7%|
| **Tau_rawDeepTau2018v2p5VSmu** | Float_t| byDeepTau2018v2p5VSmu raw output discriminator (deepTau2018v2p5) | 1.6| 2.0| 1.4%|
| **Tau_rawIso** | Float_t| combined isolation (deltaBeta corrections) | 1.9| 2.3| 1.6%|
| **Tau_rawIsodR03** | Float_t| combined isolation (deltaBeta corrections, dR=0.3) | 1.7| 2.1| 1.5%|
| **Tau_rawPNetVSe** | Float_t| raw output of ParticleNetVsE discriminator (PNet 2023 - CHS Jets) | 2.1| 2.5| 1.8%|
| **Tau_rawPNetVSjet** | Float_t| raw output of ParticleNetVsJet discriminator (PNet 2023 - CHS Jets) | 2.2| 2.8| 1.9%|
| **Tau_rawPNetVSmu** | Float_t| raw output of ParticleNetVsMu discriminator (PNet 2023 - CHS Jets) | 1.5| 1.9| 1.3%|
| **Tau_rawUParTVSe** | Float_t| raw output of UParTVsE discriminator (Unified ParT 2024 - PUPPI Jets) | 2.0| 2.5| 1.8%|
| **Tau_rawUParTVSjet** | Float_t| raw output of UParTVsJet discriminator (Unified ParT 2024 - PUPPI Jets) | 2.2| 2.7| 1.9%|
| **Tau_rawUParTVSmu** | Float_t| raw output of UParTVsMu discriminator (Unified ParT 2024 - PUPPI Jets) | 1.6| 2.0| 1.4%|
| **Tau_refitSVchi2** | Float_t| reduced chi2, i.e. chi2/ndof, of SV fit | 1.1| 1.4| 1.0%|
| **Tau_refitSVcov00** | Float_t| Covariance of SV (0,0) | 1.2| 1.5| 1.1%|
| **Tau_refitSVcov10** | Float_t| Covariance of SV (1,0) | 1.2| 1.5| 1.1%|
| **Tau_refitSVcov11** | Float_t| Covariance of SV (1,1) | 1.2| 1.5| 1.1%|
| **Tau_refitSVcov20** | Float_t| Covariance of SV (2,0) | 1.2| 1.5| 1.1%|
| **Tau_refitSVcov21** | Float_t| Covariance of SV (2,1) | 1.2| 1.5| 1.1%|
| **Tau_refitSVcov22** | Float_t| Covariance of SV (2,2) | 1.2| 1.5| 1.1%|
| **Tau_refitSVx** | Float_t| x coordinate of SV | 1.2| 1.5| 1.1%|
| **Tau_refitSVy** | Float_t| y coordinate of SV | 1.2| 1.5| 1.0%|
| **Tau_refitSVz** | Float_t| z coordinate of SV | 1.2| 1.5| 1.1%|
| **Tau_svIdx1** | Short_t(index to Sv)| index of first matching secondary vertex | 0.7| 0.9| 0.6%|
| **Tau_svIdx2** | Short_t(index to Sv)| index of second matching secondary vertex | 0.6| 0.7| 0.5%|
| **nTau** | Int_t| slimmedTaus after basic selection (pt > 18 && ((tauID("decayModeFindingNewDMs") > 0.5 && (tauID("byLooseCombinedIsolationDeltaBetaCorr3Hits") \|\| (tauID("chargedIsoPtSumdR03")+max(0.,tauID("neutralIsoPtSumdR03")-0.072*tauID("puCorrPtSum"))<2.5) \|\| tauID("byVVVLooseDeepTau2018v2p5VSjet"))) \|\| (?isTauIDAvailable("byUTagCHSVSjetraw")?tauID("byUTagCHSVSjetraw"):-1) > 0.05 \|\| (?isTauIDAvailable("byUTagPUPPIVSjetraw")?tauID("byUTagPUPPIVSjetraw"):-1) > 0.05)) | 0.3| 0.4| 0.3%|

### TauProd
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **TauProd_eta** | Float_t| eta | 5.0| 2.5| 28.6%|
| **TauProd_pdgId** | Int_t| PDG code assigned by the event reconstruction (not by MC truth) | 1.5| 0.7| 8.5%|
| **TauProd_phi** | Float_t| phi | 5.1| 2.5| 28.8%|
| **TauProd_pt** | Float_t| pt | 4.5| 2.3| 25.7%|
| **TauProd_tauIdx** | Short_t(index to Tau)| index of the mother tau | 1.0| 0.5| 5.5%|
| **nTauProd** | Int_t| tau signal candidates | 0.5| 0.2| 2.8%|

### TrigObj
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **TrigObj_eta** | Float_t| eta | 42.5| 2.0| 27.1%|
| **TrigObj_filterBits** | ULong64_t| extra bits of associated information: 0 => HLT_AK8PFJetX_SoftDropMassY_PFAK8ParticleNetTauTau0p30, 1 => HLT_AK8PFJetX_SoftDropMassY_PNetTauTau0p03, 2 => HLT_AK8PFJetX_SoftDropMassY_PNetTauTau0p05 for BoostedTau; 0 => CaloIdL_TrackIdL_IsoVL, 1 => 1e (WPTight with possibile contribution from Xtriggers besides singleElectron), 2 => 1e (WPLoose), 3 => OverlapFilter PFTau, 4 => 2e (Leg 1), 5 => 2e (Leg 2), 6 => 1e-1mu, 7 => 1e-1tau, 8 => 3e, 9 => 2e-1mu, 10 => 1e-2mu, 11 => 1e (32_L1DoubleEG_AND_L1SingleEGOr), 12 => 1e (CaloIdVT_GsfTrkIdT), 13 => 1e (PFJet), 14 => 1e (Photon175_OR_Photon200), 15 => 2e (CaloIdL_MW seeded), 16 => 2e (CaloIdL_MW unseeded), 17 => 1e-1tau PNet, 18 => 1e (HLT30WPTightGSfTrackIso), 19 => WPTightGsfTrackIso for VBF for Electron; 0 => , 1 => hltAK8SingleCaloJet200, 2 => , 3 => hltAK8SinglePFJets230SoftDropMass40BTagParticleNetBB0p35 OR hltAK8SinglePFJets250SoftDropMass40BTagParticleNetBB0p35 OR hltAK8SinglePFJets275SoftDropMass40BTagParticleNetBB0p35, 4 => hltAK8DoublePFJetSDModMass30, 5 => hltAK8DoublePFJetSDModMass50, 6 => hltAK8SinglePFJets*SoftDropMass*PNetBBTag0p06 for FatJet; 0 => hltL1sTripleJetVBFIorHTTIorDoubleJetCIorSingleJet, 1 => hltL1sQuadJetC50IorQuadJetC60IorHTT280IorHTT300IorHTT320IorTripleJet846848VBFIorTripleJet887256VBFIorTripleJet927664VBF OR hltL1sQuadJetCIorTripleJetVBFIorHTT, 2 => hltL1sQuadJetC60IorHTT380IorHTT280QuadJetIorHTT300QuadJet OR hltL1sQuadJetC50to60IorHTT280to500IorHTT250to340QuadJet, 3 => hltCaloQuadJet30HT300 OR hltCaloQuadJet30HT320, 4 => hltPFCentralJetsLooseIDQuad30HT300 OR hltPFCentralJetsLooseIDQuad30HT330, 5 => hltPFHT280Jet30 for HT; 0 => hlt4PixelOnlyPFCentralJetTightIDPt20, 1 => hlt3PixelOnlyPFCentralJetTightIDPt30, 2 => hltPFJetFilterTwoC30, 3 => hlt4PFCentralJetTightIDPt30, 4 => hlt4PFCentralJetTightIDPt35, 5 => hltQuadCentralJet30, 6 => hlt2PixelOnlyPFCentralJetTightIDPt40, 7 => hltL1sTripleJet1008572VBFIorHTTIorDoubleJetCIorSingleJet OR hltL1sTripleJet1058576VBFIorHTTIorDoubleJetCIorSingleJet OR hltL1sTripleJetVBFIorHTTIorSingleJet, 8 => hlt3PFCentralJetTightIDPt40, 9 => hlt3PFCentralJetTightIDPt45, 10 => hltL1sQuadJetC60IorHTT380IorHTT280QuadJetIorHTT300QuadJet OR hltL1sQuadJetC50to60IorHTT280to500IorHTT250to340QuadJet, 11 => hltBTagCaloDeepCSVp17Double, 12 => hltPFCentralJetLooseIDQuad30, 13 => hlt1PFCentralJetLooseID75, 14 => hlt2PFCentralJetLooseID60, 15 => hlt3PFCentralJetLooseID45, 16 => hlt4PFCentralJetLooseID40, 17 => (DiTau+Jet (Jet) Signal), 18 => (VBF DiTau Jets), 19 => (VBF SingleTau Jets), 20 => Muon+Tau+Jet (Jet) Monitoring, 21 => hlt2PFCentralJetTightIDPt50, 22 => hlt1PixelOnlyPFCentralJetTightIDPt60, 23 => hlt1PFCentralJetTightIDPt70, 24 => hltBTagPFDeepJet1p5Single, 25 => hltBTagPFDeepJet4p5Triple, 26 => hltBTagCentralJetPt35PFParticleNet2BTagSum0p65 OR hltBTagCentralJetPt30PFParticleNet2BTagSum0p65 OR hltPFJetTwoC30PFBTagParticleNet2BTagSum0p65 OR hltPFCentralJetPt30PNet2BTagMean0p55, 27 => hlt2PixelOnlyPFCentralJetTightIDPt20 OR hlt1PixelOnlyPFCentralJetTightIDPt50, 28 => hlt2PFCentralJetTightIDPt30 OR hltPF2CentralJetTightIDPt30, 29 => hlt1PFCentralJetTightIDPt60, 30 => hltPF2CentralJetPt30PNet2BTagMean0p50, 31 => hlt4PFCentralJetPt25, 32 => hltPFCentralJetNoIDPt25PNet1BTag0p20, 33 => hltPFCentralJetNoIDPt25PNet1TauHTag0p50, 34 => hlt4PFCentralJetTightIDPt25, 35 => hltPFCentralJetPt25PNet2BTagMean0p55, 36 => hltL1PFJetCategoriesVBFinclLoose OR hltL1PFJetCategoriesVBFinclLooseTripleJet OR hltL1PFJetCategoriesVBFinclTight1050, 37 => hltL1PFJetCategoriesVBFdijetQuadjet OR hltL1PFJetCategoriesVBFdijetFivejets OR hltL1PFJetCategoriesVBFdijetSixjets OR hltL1PFJetCategoriesVBFdijetTightQuadjet800, 38 => hltL1PFJetCategoriesVBFMET OR hltL1PFJetCategoriesVBFMETTripleJet OR hltL1PFJetCategoriesVBFMETTight650, 39 => hltL1PFJetCategoriesVBFMu OR hltL1PFJetCategoriesVBFMuTripleJet OR hltL1PFJetCategoriesVBFMuTight750, 40 => hltOverlapFilterDoublePFJet45Photon12 OR hltOverlapFilterDoublePFJet45Photon17 OR hltDiPFJet50Photon22OverlapFilter, 41 => hltOverlapFilterDoublePFJet45Ele12 OR hltOverlapFilterDoublePFJet45Ele17 OR hltDiPFJet50Ele22OverlapFilter, 42 => SinglePFJetX, 43 => SinglePFJetFwdX, 44 => DiPFJetAveX, 45 => DiPFJetAveX_HFJEC for Jet; 0 => hltCaloQuadJet30HT300 OR hltCaloQuadJet30HT320, 1 => hltPFCentralJetsLooseIDQuad30HT300 OR hltPFCentralJetsLooseIDQuad30HT330 for MHT; 0 => TrkIsoVVL, 1 => Iso, 2 => OverlapFilter PFTau, 3 => 1mu, 4 => 2mu, 5 => 1mu-1e, 6 => 1mu-1tau, 7 => 3mu, 8 => 2mu-1e, 9 => 1mu-2e, 10 => 1mu (Mu50), 11 => 1mu (Mu100), 12 => 1mu-1photon, 13 => 1mu-1tau PNet for Muon; 0 => hltEG33L1EG26HEFilter, 1 => hltEG50HEFilter, 2 => hltEG75HEFilter, 3 => hltEG90HEFilter, 4 => hltEG120HEFilter, 5 => hltEG150HEFilter, 6 => hltEG175HEFilter, 7 => hltEG200HEFilter, 8 => hltHtEcal800, 9 => hltEG45EBTightIDTightIsoTrackIsoFilter, 10 => hltEG50EBTightIDTightIsoTrackIsoFilter, 11 => hltEG110EBTightIDTightIsoTrackIsoFilter, 12 => hltEG120EBTightIDTightIsoTrackIsoFilter, 13 => 1mu-1photon, 14 => hltEG30LR9Id85b90eHE12R9Id50b80eR9IdLastFilter, 15 => hltEG30LIso60CaloId15b35eHE12R9Id50b80eEcalIsoLastFilter, 16 => hltEG22Iso60CaloId15b35eHE12R9Id50b80eTrackIsoUnseededLastFilter, 17 => hltEG22R9Id85b90eHE12R9Id50b80eR9UnseededLastFilter, 18 => hltEG30Iso60CaloId15b35eR9Id50b90eHE12b10eR9Id50b80eEcalIsoFilter, 19 => hltEG18TrackIso60Iso60CaloId15b35eR9Id50b90eHE12b10eR9Id50b80eTrackIsoUnseededFilter, 20 => hltEG*L1VBFLooseIsoEGHEFilter for Photon; 0 => Loose, 1 => Medium, 2 => Tight, 3 => DeepTau no spec WP, 4 => PNet no specified WP, 5 => ChargedIso, 6 => Dxy, 7 => e-tau inside filter, 8 => mu-tau inside filter, 9 => Single Tau, 10 => VBF DiTau, 11 => di-tau, 12 => e-tau, 13 => mu-tau, 14 => di-tau + PFJet, 15 => e-tau displaced, 16 => mu-tau displaced, 17 => di-tau displaced, 18 => Monitoring, 19 => VBF SingleTau Monitoring, 20 => DiTau+Jet Monitoring, 21 => Monitoring muTau displaced, 22 => OneProng, 23 => DiTau Monitoring, 24 => OverlapFilter, 25 => VBF DiTau monitoring, 26 => SingleTau Monitoring, 27 => MatchL1HLT, 28 => HPS, 29 => single PF-tau inside filter, 30 => VBF SingleTau for Tau; | 6.7| 0.3| 4.3%|
| **TrigObj_id** | UShort_t| ID of the object: 1515 = BoostedTau, 11 = Electron(PixelMatched e/gamma), 6 = FatJet, 3 = HT, 1 = Jet, 2 = MET, 4 = MHT, 13 = Muon, 22 = Photon, 15 = Tau | 2.9| 0.1| 1.8%|
| **TrigObj_l1charge** | Short_t| charge of associated L1 seed | 1.3| 0.1| 0.8%|
| **TrigObj_l1iso** | Int_t| iso of associated L1 seed | 5.0| 0.2| 3.2%|
| **TrigObj_l1pt** | Float_t| pt of associated L1 seed | 11.5| 0.6| 7.3%|
| **TrigObj_l1pt_2** | Float_t| pt of associated secondary L1 seed | 1.5| 0.1| 1.0%|
| **TrigObj_l2pt** | Float_t| pt of associated "L2" seed (i.e. HLT before tracking/PF) | 4.4| 0.2| 2.8%|
| **TrigObj_phi** | Float_t| phi | 43.1| 2.1| 27.5%|
| **TrigObj_pt** | Float_t| pt | 37.1| 1.8| 23.7%|
| **nTrigObj** | Int_t|  | 0.8| 0.0| 0.5%|

### TrkMET
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **TrkMET_phi** | Float_t| raw track MET phi | 2.0| 2.0| 34.8%|
| **TrkMET_pt** | Float_t| raw track MET pt | 1.9| 1.9| 33.3%|
| **TrkMET_sumEt** | Float_t| raw track scalar sum of Et | 1.8| 1.8| 31.9%|

### boostedTau
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **boostedTau_charge** | Int_t| electric charge | 0.4| 1.6| 2.1%|
| **boostedTau_chargedIso** | Float_t| charged isolation | 0.9| 3.3| 4.3%|
| **boostedTau_decayMode** | Int_t| decayMode() | 0.5| 1.9| 2.4%|
| **boostedTau_eta** | Float_t| eta | 1.1| 4.0| 5.1%|
| **boostedTau_idAntiEle2018** | UChar_t| Anti-electron MVA discriminator V6 (2018): 1 = VLoose, 2 = Loose, 3 = Medium, 4 = Tight, 5 = VTight | 0.5| 1.7| 2.3%|
| **boostedTau_idAntiMu** | UChar_t| Anti-muon discriminator V3: : 1 = Loose, 2 = Tight | 0.4| 1.4| 1.8%|
| **boostedTau_idMVAnewDM2017v2** | UChar_t| IsolationMVArun2DBnewDMwLT ID working point (2017v2): 1 = VVLoose, 2 = VLoose, 3 = Loose, 4 = Medium, 5 = Tight, 6 = VTight, 7 = VVTight | 0.5| 1.8| 2.3%|
| **boostedTau_idMVAoldDM2017v2** | UChar_t| IsolationMVArun2DBoldDMwLT ID working point (2017v2): 1 = VVLoose, 2 = VLoose, 3 = Loose, 4 = Medium, 5 = Tight, 6 = VTight, 7 = VVTight | 0.5| 1.8| 2.3%|
| **boostedTau_jetIdx** | Short_t(index to Jet)| index of the associated jet (-1 if none) | 0.5| 1.7| 2.2%|
| **boostedTau_leadTkDeltaEta** | Float_t| eta of the leading track, minus tau eta | 0.9| 3.3| 4.3%|
| **boostedTau_leadTkDeltaPhi** | Float_t| phi of the leading track, minus tau phi | 0.9| 3.4| 4.3%|
| **boostedTau_leadTkPtOverTauPt** | Float_t| pt of the leading track divided by tau pt | 0.9| 3.2| 4.1%|
| **boostedTau_mass** | Float_t| mass | 0.8| 2.9| 3.8%|
| **boostedTau_neutralIso** | Float_t| neutral (photon) isolation | 0.8| 2.8| 3.6%|
| **boostedTau_phi** | Float_t| phi | 1.1| 4.0| 5.1%|
| **boostedTau_photonsOutsideSignalCone** | Float_t| sum of photons outside signal cone | 0.7| 2.4| 3.1%|
| **boostedTau_pt** | Float_t| pt | 1.3| 4.8| 6.3%|
| **boostedTau_puCorr** | Float_t| pileup correction | 0.9| 3.3| 4.2%|
| **boostedTau_rawAntiEle2018** | Float_t| Anti-electron MVA discriminator V6 raw output discriminator (2018) | 0.9| 3.3| 4.3%|
| **boostedTau_rawAntiEleCat2018** | Short_t| Anti-electron MVA discriminator V6 category (2018) | 0.5| 1.9| 2.5%|
| **boostedTau_rawBoostedDeepTauRunIIv2p0VSe** | Float_t| BoostedDeepTau(v2p0) tagger for boostedTaus raw scores Vs e | 0.9| 3.3| 4.3%|
| **boostedTau_rawBoostedDeepTauRunIIv2p0VSjet** | Float_t| BoostedDeepTau(v2p0) tagger for boostedTaus raw scores Vs jet | 0.8| 2.9| 3.7%|
| **boostedTau_rawBoostedDeepTauRunIIv2p0VSmu** | Float_t| BoostedDeepTau(v2p0) tagger for boostedTaus raw scores Vs mu | 0.7| 2.5| 3.2%|
| **boostedTau_rawIso** | Float_t| combined isolation (deltaBeta corrections) | 0.9| 3.3| 4.3%|
| **boostedTau_rawIsodR03** | Float_t| combined isolation (deltaBeta corrections, dR=0.3) | 0.9| 3.2| 4.1%|
| **boostedTau_rawMVAnewDM2017v2** | Float_t| byIsolationMVArun2DBnewDMwLT raw output discriminator (2017v2) | 1.0| 3.5| 4.6%|
| **boostedTau_rawMVAoldDM2017v2** | Float_t| byIsolationMVArun2DBoldDMwLT raw output discriminator (2017v2) | 0.9| 3.3| 4.3%|
| **nboostedTau** | Int_t| slimmedBoostedTaus after basic selection (pt > 25 && tauID("decayModeFindingNewDMs") && (tauID("byVVLooseIsolationMVArun2DBoldDMwLT") \|\| tauID("byVVLooseIsolationMVArun2DBnewDMwLT") \|\| tauID("byBoostedDeepTau20161718v2p0VSjetraw") > 0.82)) | 0.2| 0.8| 1.1%|

### bunchCrossing
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **bunchCrossing** | UInt_t| bunchCrossing/i | 1.6| 1.6| 100.0%|

### event
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **event** | ULong64_t| event/l | 2.8| 2.8| 100.0%|

### luminosityBlock
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **luminosityBlock** | UInt_t| luminosityBlock/i | 0.0| 0.0| 100.0%|

### orbitNumber
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **orbitNumber** | UInt_t| orbitNumber/i | 2.3| 2.3| 100.0%|

### run
| Object property | Type | Description | b/event | b/item | % |
| - | - | - | - | - | - |
| **run** | UInt_t| run/i | 0.0| 0.0| 100.0%|

