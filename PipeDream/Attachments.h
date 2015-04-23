//
//  Attachments.h
//  JasonParsing
//
//  Created by Kenan Uzel on 4/9/15.
//  Copyright (c) 2015 Kenan Uzel. All rights reserved.
//


#import <Mantle/Mantle.h>
#import "Article.h"
#import "Image.h"



@interface Attachments :MTLModel <MTLJSONSerializing,MTLTransformerErrorHandling>



@property(nonatomic, readonly,strong) NSNumber *attachmentID;

@property(strong, nonatomic, readonly) NSString *attachmentTitle;
@property(strong, nonatomic, readonly) NSDictionary *articleImages;

@property (readonly, nonatomic, assign, getter = isAttachmentForImage) BOOL imageAttachment;


@end
