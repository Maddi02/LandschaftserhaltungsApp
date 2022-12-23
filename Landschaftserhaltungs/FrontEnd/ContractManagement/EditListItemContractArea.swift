//
//  EditListItemContractArea.swift
//  Landschaftserhaltungs
//
//  Created by Martin Hummel on 06.11.22.
//

import SwiftUI

struct EditListItemContractArea: View {

    var type : String
    @ObservedObject var listEntry : ListEntry
    var context = CoreDataManager.shared.persistentContainer.viewContext
    @Environment(\.dismiss) var dismiss
    @State var field = FieldInformation()
    @State var farming = " "
    @State var dateOfTaking = Date()
    @State var position = " "
    @State var vegetationDescription = " "
    @State var bloomAspekt = " "
    @State var evaluationSpeciesInventory = " "
    @State var evaluationHabitatStructures = " "
    @State var evaluationImpairments = " "
    @State var overallAssessmentConservation  = " "
    @State var protectionStatus  = " "
    @State var faunisticObservations  = " "
    @State var contractTarget   = " "
    @State var adjustmentEditions   = " "
    @State var furtherCareMeasures   = " "



    @State private var textStyle = UIFont.TextStyle.body
    @State private var heightFraming: CGFloat?
    @State private var heightDate: CGFloat?
    @State private var heightPosition: CGFloat?
    @State private var heightVegetationDescription: CGFloat?
    @State private var heightBloomAspect: CGFloat?
    @State private var heightEvaluationSpeciesInventory: CGFloat?
    @State private var heightEvaluationHabitatStructures: CGFloat?
    @State private var heightEvaluationImpairments: CGFloat?
    @State private var heightOverallAssessmentConservation: CGFloat?
    @State private var heightProtectionStatus: CGFloat?
    @State private var heightFaunisticObservations: CGFloat?
    @State private var heightContractTarget: CGFloat?
    @State private var heightAdjustmentEditions: CGFloat?
    @State private var heightFurtherCareMeasures: CGFloat?
    let minHeightFraming: CGFloat = 30
    let minHeightDate: CGFloat = 30
    let minHeightPosition: CGFloat = 30
    let minHeightBloomAspect: CGFloat = 30
    let minHeightVegetationDescription: CGFloat = 30
    let minHeightEvaluationSpeciesInventory: CGFloat = 30
    let minHeightEvaluationHabitatStructures: CGFloat = 30
    let minHeightEvaluationImpairments: CGFloat = 30
    let minHeightOverallAssessmentConservation: CGFloat = 30
    let minHeightProtectionStatus: CGFloat = 30
    let minHeightFaunisticObservations: CGFloat = 30
    let minHeightContractTarget: CGFloat = 30
    let minHeightAdjustmentEditions: CGFloat = 30
    let minHeightFurtherCareMeasures: CGFloat = 30




    private func textDidChangeFarming(_ textView: UITextView) {
        self.heightFraming = max(textView.contentSize.height, minHeightFraming)
    }

    private func textDidChangeDate(_ textView: UITextView) {
        self.heightDate = max(textView.contentSize.height, minHeightDate)
    }

    private func textDidChangePosition(_ textView: UITextView) {
        self.heightPosition = max(textView.contentSize.height, minHeightPosition)
    }

    private func textDidChangeBloomAspect(_ textView: UITextView) {
        self.heightBloomAspect = max(textView.contentSize.height, minHeightBloomAspect)
    }

    private func textDidChangeEvaluationSpeciesInventory(_ textView: UITextView) {
        self.heightEvaluationSpeciesInventory = max(textView.contentSize.height, minHeightEvaluationSpeciesInventory)
    }

    private func textDidChangeEvaluationHabitatStructures(_ textView: UITextView) {
        self.heightEvaluationHabitatStructures = max(textView.contentSize.height, minHeightEvaluationHabitatStructures)
    }

    private func textDidChangeEvaluationImpairments(_ textView: UITextView) {
        self.heightEvaluationImpairments = max(textView.contentSize.height, minHeightEvaluationImpairments)
    }

    private func textDidChangeOverallAssessmentConservation(_ textView: UITextView) {
        self.heightOverallAssessmentConservation = max(textView.contentSize.height, minHeightOverallAssessmentConservation)
    }
    private func textDidChangeProtectionStatus(_ textView: UITextView) {
        self.heightProtectionStatus = max(textView.contentSize.height, minHeightProtectionStatus)
    }

    private func textDidChangeFaunisticObservations(_ textView: UITextView) {
        self.heightFaunisticObservations = max(textView.contentSize.height, minHeightFaunisticObservations)
    }

    private func textDidChangeContractTarget(_ textView: UITextView) {
        self.heightContractTarget = max(textView.contentSize.height, minHeightContractTarget)
    }

    private func textDidChangeAdjustmentEditions(_ textView: UITextView) {
        self.heightAdjustmentEditions = max(textView.contentSize.height, minHeightAdjustmentEditions)
    }
    private func textDidChangeFurtherCareMeasures(_ textView: UITextView) {
        self.heightFurtherCareMeasures = max(textView.contentSize.height, minHeightFaunisticObservations)
    }

    private func textDidChangeVegetation(_ textView: UITextView) {
        self.heightVegetationDescription = max(textView.contentSize.height, minHeightVegetationDescription)
    }






    var body: some View {
        HStack {




            if(listEntry.PlantArray.count > 0 || listEntry.PlantArrayLongTerm.count > 0) {


                Form {

                    HStack {
                        HStack {
                            Text("Bewirtschaftung")
                            Spacer()

                        }
                        HStack {
                            WrappedTextView(text: $farming, textDidChange: self.textDidChangeFarming)
                                    .frame(height: heightFraming ?? minHeightFraming).background(Color.clear)
                        }
                    }


                    HStack {
                        HStack {
                            Text("Lage")
                            Spacer()

                        }
                        HStack {
                            WrappedTextView(text: $position, textDidChange: self.textDidChangePosition(_:))
                                    .frame(height: heightPosition ?? minHeightPosition).background(Color.clear)
                        }
                    }

                    HStack {
                        HStack {
                            Text("Vegetationsbeschreibung")
                            Spacer()

                        }
                        HStack {
                            WrappedTextView(text: $vegetationDescription, textDidChange: self.textDidChangeVegetation(_:))
                                    .frame(height: heightVegetationDescription ?? minHeightVegetationDescription).background(Color.clear)
                        }
                    }

                    HStack {
                        HStack {
                            Text("Blühaspekt")
                            Spacer()

                        }
                        HStack {
                            WrappedTextView(text: $bloomAspekt, textDidChange: self.textDidChangeBloomAspect(_:))
                                    .frame(height: heightBloomAspect ?? minHeightBloomAspect).background(Color.clear)
                        }
                    }

                    HStack {
                        HStack {
                            Text("Schutzstatus")
                            Spacer()

                        }
                        HStack {
                            WrappedTextView(text: $protectionStatus, textDidChange: self.textDidChangeProtectionStatus(_:))
                                    .frame(height: heightProtectionStatus ?? minHeightProtectionStatus).background(Color.clear)
                        }
                    }

                    HStack {
                        HStack {
                            Text("Faunistische Beobachtungen")
                            Spacer()

                        }
                        HStack {
                            WrappedTextView(text: $faunisticObservations, textDidChange: self.textDidChangeFaunisticObservations(_:))
                                    .frame(height: heightFaunisticObservations ?? minHeightFaunisticObservations).background(Color.clear)
                        }
                    }
                    HStack {
                        HStack {
                            Text("Vertragsziel erfüllt")
                            Spacer()

                        }
                        HStack {
                            WrappedTextView(text: $contractTarget, textDidChange: self.textDidChangeContractTarget(_:))
                                    .frame(height: heightContractTarget ?? minHeightContractTarget).background(Color.clear)
                        }
                    }

                    HStack {
                        HStack {
                            Text("Anpassung Auflagen")
                            Spacer()

                        }
                        HStack {
                            WrappedTextView(text: $adjustmentEditions, textDidChange: self.textDidChangeAdjustmentEditions(_:))
                                    .frame(height: heightAdjustmentEditions ?? minHeightAdjustmentEditions).background(Color.clear)
                        }
                    }
                    HStack {
                        HStack {
                            Text("Weitere Pflegemaßnahmen")
                            Spacer()

                        }
                        HStack {
                            WrappedTextView(text: $furtherCareMeasures, textDidChange: self.textDidChangeFurtherCareMeasures(_:))
                                    .frame(height: heightFurtherCareMeasures ?? minHeightFurtherCareMeasures).background(Color.clear)
                        }
                    }

                    if (type == "FFH Mähwiese") {
                        HStack {
                            HStack {
                                Text("Bewertung Arteninventar")
                                Spacer()

                            }
                            HStack {
                                WrappedTextView(text: $evaluationSpeciesInventory, textDidChange: self.textDidChangeEvaluationSpeciesInventory(_:))
                                        .frame(height: heightEvaluationSpeciesInventory ?? minHeightEvaluationSpeciesInventory).background(Color.clear)
                            }
                        }

                        HStack {
                            HStack {
                                Text("Bewertung Habitatstrukturen")
                                Spacer()

                            }
                            HStack {
                                WrappedTextView(text: $evaluationHabitatStructures, textDidChange: self.textDidChangeEvaluationHabitatStructures(_:))
                                        .frame(height: heightEvaluationHabitatStructures ?? minHeightEvaluationHabitatStructures).background(Color.clear)
                            }
                        }

                        HStack {
                            HStack {
                                Text("Bewertung Beeinträchtigungen")
                                Spacer()

                            }
                            HStack {
                                WrappedTextView(text: $evaluationImpairments, textDidChange: self.textDidChangeEvaluationImpairments(_:))
                                        .frame(height: heightEvaluationImpairments ?? minHeightEvaluationImpairments).background(Color.clear)
                            }
                        }

                        HStack {
                            HStack {
                                Text("Gesamtbewertung Erhaltungszustand") .frame(maxWidth: .infinity, alignment: .center)
                                Spacer()

                            }
                            HStack {
                                WrappedTextView(text: $overallAssessmentConservation, textDidChange: self.textDidChangeOverallAssessmentConservation(_:))
                                        .frame(height: heightOverallAssessmentConservation ?? minHeightOverallAssessmentConservation).background(Color.clear)
                            }
                        }

                    }


                }


                        .onAppear(perform: {
                            setPropertys()
                        })


            }

            else {

                VStack{
                    Text("Sie müssen zu erst eine Artenzählung durchführen welche mindestens eine Pflanze enthält")

                    Button("Zurück"){
                        dismiss()
                    }.frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .listRowBackground(Color.blue)
                }


            }


        }     .onTapGesture {
            UIApplication.shared.endEditing()
                }
        if(listEntry.PlantArray.count > 0 || listEntry.PlantArrayLongTerm.count > 0) {
            Button("Speichern") {
                updateValues()
                do {
                    try context.save()
                } catch {
                    print(error)
                }
                dismiss()
            }.frame(minWidth: 0, maxWidth: .infinity , minHeight: 30 , maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .listRowBackground(Color.blue)
        }


    }


    private func updateValues()
    {

        listEntry.infos?.farming = farming
        listEntry.infos?.dataOfTaking = dateOfTaking
        listEntry.infos?.vegetationDescription = vegetationDescription
        listEntry.infos?.position = position
        listEntry.infos?.bloomAspect = bloomAspekt
        listEntry.infos?.evaluationSpeciesInventory = evaluationSpeciesInventory
        listEntry.infos?.assessmentHabitatStructure = evaluationHabitatStructures
        listEntry.infos?.ratingImpairment = evaluationImpairments
        listEntry.infos?.overallAssessmentOfTheStateOfPreservation = overallAssessmentConservation
        listEntry.infos?.protectionStatus = protectionStatus
        listEntry.infos?.faunisticObservation = faunisticObservations
        listEntry.infos?.contractTarget = contractTarget
        listEntry.infos?.adaptationEditions = adjustmentEditions
        listEntry.infos?.furtherMaintenanceMeasures = furtherCareMeasures
    }



    private func setPropertys()
    {
        dateOfTaking = listEntry.infos?.dataOfTaking ?? Date()
        farming = listEntry.infos?.farming ?? " "
        position = listEntry.infos?.position ?? " "
        vegetationDescription = listEntry.infos?.vegetationDescription ?? " "
        bloomAspekt = listEntry.infos?.bloomAspect ?? " "
        evaluationSpeciesInventory = listEntry.infos?.evaluationSpeciesInventory ?? " "
        evaluationHabitatStructures = listEntry.infos?.assessmentHabitatStructure ?? " "
        evaluationImpairments = listEntry.infos?.ratingImpairment ?? " "
        overallAssessmentConservation = listEntry.infos?.overallAssessmentOfTheStateOfPreservation ?? " "
        protectionStatus = listEntry.infos?.protectionStatus ?? " "
        faunisticObservations = listEntry.infos?.faunisticObservation ?? " "
        contractTarget = listEntry.infos?.contractTarget ?? " "
        adjustmentEditions = listEntry.infos?.adaptationEditions ?? " "
        furtherCareMeasures = listEntry.infos?.furtherMaintenanceMeasures ?? " "
    }
}


