//
//  PWRouteInstructionCollectionViewCell.h
//  PWMapKit
//
//  Created by Steven Spry on 5/23/16.
//  Copyright © 2016 Phunware. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PWRouteInstruction;

@interface RouteInstructionCollectionViewCell : UICollectionViewCell

@property (strong,nonatomic) PWRouteInstruction *instruction;

@end
