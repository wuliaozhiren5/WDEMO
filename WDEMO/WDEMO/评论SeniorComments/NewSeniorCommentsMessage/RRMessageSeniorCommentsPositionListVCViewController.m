//
//  RRMessageSeniorCommentsPositionListVCViewController.m
//  PUClient
//
//  Created by WDEMO on 2021/6/3.
//  Copyright © 2021 RRMJ. All rights reserved.
//

#import "RRMessageSeniorCommentsPositionListVCViewController.h"

@interface RRMessageSeniorCommentsPositionListVCViewController ()

@end

@implementation RRMessageSeniorCommentsPositionListVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)clickTextBtn:(UIButton *)btn {
    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            //新评论
//            @weakify(self);
//            [self.service showSeniorSingleTextType:RRCommentViewTypeSeniorReplyComment placeholder:[NSString stringWithFormat:@"回复%@", self.commentModel.author.nickName ?: @""] key:self.commentModel.ID superView:nil submitBlock:^(NSString * _Nonnull content, NSArray * _Nonnull imageDataArray, BOOL isSpoiler) {
//                @strongify(self);
//                [self articleReplay:content imageDatas:imageDataArray toComment:self.commentModel isSpoiler:isSpoiler msgLevel:RRSeniorCommentCreateApiMsgLevelTwo];
//            }];
//        }
//    }];
}

- (void)clickCellDetail {
    if ([self.targetType isEqualToString:@"drama"]) {
//        [[RRAppLinkManager sharedManager] goSeasonDetail:self.targetTypeId title:nil isMovie:NO toRoot:NO];

    } else if ([self.targetType isEqualToString:@"drama_comment"]) {
//        [[RRAppLinkManager sharedManager] goDramaCommentDetail:self.targetTypeId toRoot:NO];
    } else {
        return;;
    }
}

- (void)clickCommentWithModel:(RRSeniorCommentsModel *)model {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            @weakify(self);
//            [self.service showSeniorSingleTextType:RRCommentViewTypeSeniorReplyComment placeholder:[NSString stringWithFormat:@"回复%@", model.author.nickName ?: @""] key:model.ID superView:nil submitBlock:^(NSString * _Nonnull content, NSArray * _Nonnull imageDataArray, BOOL isSpoiler) {
//                @strongify(self);
//                [self articleReplay:content imageDatas:imageDataArray toComment:model isSpoiler:isSpoiler msgLevel:RRSeniorCommentCreateApiMsgLevelTwo];
//            }];
//        }
//    }];
}

- (void)clickReplyWithModel:(RRSeniorCommentsModel *)model {
//    @weakify(self);
//    [[RRAppLinkManager sharedManager] goLoginBlockToRoot:NO loginFinish:^(BOOL sucess) {
//        @strongify(self);
//        if (sucess) {
//            @weakify(self);
//            [self.service showSeniorSingleTextType:RRCommentViewTypeSeniorReplyComment placeholder:[NSString stringWithFormat:@"回复%@", model.author.nickName ?: @""] key:model.ID superView:nil submitBlock:^(NSString * _Nonnull content, NSArray * _Nonnull imageDataArray, BOOL isSpoiler) {
//                @strongify(self);
//                [self articleReplay:content imageDatas:imageDataArray toComment:model isSpoiler:isSpoiler msgLevel:RRSeniorCommentCreateApiMsgLevelThree];
//            }];
//        }
//    }];
}

////新评论
////发评论
//- (void)articleReplay:(NSString *)content imageDatas:(NSArray *)imageDatas toComment:(RRSeniorCommentsModel *)model isSpoiler:(BOOL)isSpoiler msgLevel:(RRSeniorCommentCreateApiMsgLevel)msgLevel {
//    if (self.isReplying) {
//        return;
//    }
//    if (![self checkCommentAvailable:content]) {
//        return;
//    }
//    [IanAlert showLoading:@"发送中"];
//    self.isReplying = YES;
//    if (imageDatas.count) {
//        @weakify(self);
//        [[[RRImageGetTokenApi alloc] initWith:@"comment" originalFilename:[RRImageGetTokenApi getFileNameArrayString:imageDatas]] startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
//            @strongify(self);
//            if (!error && result.code == SUCCESSCODE) {
//                NSArray *keys = [result.dataDict[@"fileKey"] componentsSeparatedByString:@","];
//                if (keys.count == imageDatas.count) {
//                    [[RRImageUploadManager manager] uploadImageDatas:imageDatas token:result.dataDict[@"token"] keys:keys atIndex:0 complete:^(NSMutableArray * _Nonnull keys) {
//                        if (keys.count == imageDatas.count) {
//                            [self createComment:content images:[RRSeniorCommentCreateApi conversionImageDatas:imageDatas keys:keys] toComment:model isSpoiler:isSpoiler msgLevel:msgLevel];
//                        } else {
//                            [IanAlert alertError:@"图片上传失败" length:TIMELENGTH];
//                            self.isReplying = NO;
//                        }
//                    }];
//                } else {
//                    [IanAlert alertError:@"图片上传失败" length:TIMELENGTH];
//                    self.isReplying = NO;
//                }
//            } else {
//                [IanAlert alertError:@"图片上传失败" length:TIMELENGTH];
//                self.isReplying = NO;
//            }
//        }];
//    } else {
//        [self createComment:content images:imageDatas toComment:model isSpoiler:isSpoiler msgLevel:msgLevel];
//    }
//}
//
//- (void)createComment:(NSString *)content images:(NSArray *)images toComment:(RRSeniorCommentsModel *)model isSpoiler:(BOOL)isSpoiler msgLevel:(RRSeniorCommentCreateApiMsgLevel)msgLevel {
//    WS(weakSelf);
//    NSString *reply2Id = @"";
//    if (model) {
//        reply2Id = model.ID;
//    }
//    NSString *reply2UseId = @"";
//    if (model) {
//        reply2UseId = model.author.ID;
//    }
//    [[[RRSeniorCommentCreateApi alloc] initCommentWithCommentType:RRSeniorCommentCreateApiTypeDRAMA typeId:@"" content:content images:images reply2Id:reply2Id spoiler:isSpoiler msgLevel:msgLevel reply2UseId:reply2UseId] startWithCompletionBlock:^(RRJsonModel *result, NSError *error) {
//        weakSelf.isReplying = NO;
//        if (error) {
//            [IanAlert alertError:error.localizedDescription length:TIMELENGTH];
//        } else {
//            if (result.code == SUCCESSCODE) {
//                [IanAlert alertSuccess:@"发表成功" length:TIMELENGTH];
//                RRSeniorCommentsModel *resultModel = [RRSeniorCommentsModel modelWithDictionary:result.data];
//                if (msgLevel == RRSeniorCommentCreateApiMsgLevelThree) {
//                    //三级回复
//                    [weakSelf replayBackResultLevelThreeModel:resultModel];
//                } else {
//                    //二级回复
//                    [weakSelf replayBackResultModel:resultModel];
//                }
//
//                [weakSelf.service closeReplyView];
//            } else if (result.code == 3001){
//                [IanAlert alertError:@"频率太快啦，喝口水歇一下" length:TIMELENGTH];
//
//            } else if (result.code == 3002){
//                [IanAlert alertError:@"已经提交过了,请别重复提交" length:TIMELENGTH];
//
//            } else {
//                [IanAlert alertError:result.msg length:TIMELENGTH];
//
//            }
//        }
//    }];
//}
//
//- (BOOL)checkCommentAvailable:(NSString *)content {
//    if (content.length <= 0) {
//        [IanAlert alertError:@"你还没写评论哦" length:TIMELENGTH];
//        return NO;
//    } else if (content.length < 3) {
//        [IanAlert alertError:@"多说点吧，别偷懒哦！" length:TIMELENGTH];
//        return NO;
//    } else if (content.length > 1000) {
//        [IanAlert alertError:@"已超出字数上限" length:TIMELENGTH];
//        return NO;
//    } else if (![content isLegaReplay:content]) {
//        [IanAlert alertError:@"请不要重复发布相同内容" length:TIMELENGTH];
//        return NO;
//    }
//    return YES;
//}
//
////二级回复
//- (void)replayBackResultModel:(RRSeniorCommentsModel *)model {
//    [self.dataSource.dataArray insertObject:model atIndex:0];
//    self.commentModel.replyCount = self.commentModel.replyCount + 1;
//    [self.tableView reloadData];
//    //获取到需要跳转位置的行数
//    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
//    //滚动到其相应的位置
//    [self.tableView scrollToRowAtIndexPath:scrollIndexPath
//                          atScrollPosition:UITableViewScrollPositionTop animated:NO];
//}
//
////三级回复
//- (void)replayBackResultLevelThreeModel:(RRSeniorCommentsModel *)model {
//    //    [self.dataSource.dataArray addObject:model];
//    [self.dataSource.dataArray insertObject:model atIndex:0];
//    self.commentModel.replyCount = self.commentModel.replyCount + 1;
//    [self.tableView reloadData];
//    //获取到需要跳转位置的行数
//    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
//    //滚动到其相应的位置
//    [self.tableView scrollToRowAtIndexPath:scrollIndexPath
//                          atScrollPosition:UITableViewScrollPositionTop animated:NO];
//}
@end
