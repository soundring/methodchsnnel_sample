// Autogenerated from Pigeon (v1.0.7), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class DeviceInfoRequest;
@class DeviceInfoReply;

@interface DeviceInfoRequest : NSObject
@property(nonatomic, copy, nullable) NSString * text;
@end

@interface DeviceInfoReply : NSObject
@property(nonatomic, copy, nullable) NSString * deviceInfoText;
@end

/// The codec used by DeviceInfoApi.
NSObject<FlutterMessageCodec> *DeviceInfoApiGetCodec(void);

@protocol DeviceInfoApi
- (nullable DeviceInfoReply *)fetchDeviceInfoReq:(DeviceInfoRequest *)req error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void DeviceInfoApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<DeviceInfoApi> *_Nullable api);

NS_ASSUME_NONNULL_END