// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:academic_elite/core/network/api_manager.dart' as _i394;
import 'package:academic_elite/core/network/network_info.dart' as _i968;
import 'package:academic_elite/core/network/network_module.dart' as _i116;
import 'package:academic_elite/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i476;
import 'package:academic_elite/features/auth/data/data_sources_impl/auth_remote_data_sourse__impl.dart'
    as _i223;
import 'package:academic_elite/features/auth/data/repos/auth_repository_impl.dart'
    as _i307;
import 'package:academic_elite/features/auth/domain/auth_repo/auth_repo.dart'
    as _i148;
import 'package:academic_elite/features/auth/domain/use_cases/create_password_use_case.dart'
    as _i790;
import 'package:academic_elite/features/auth/domain/use_cases/forgot_password_usecase.dart'
    as _i895;
import 'package:academic_elite/features/auth/domain/use_cases/login_usecase.dart'
    as _i932;
import 'package:academic_elite/features/auth/domain/use_cases/register_usecase.dart'
    as _i102;
import 'package:academic_elite/features/auth/domain/use_cases/verify_otp_usecase.dart'
    as _i1048;
import 'package:academic_elite/features/auth/presentation/manager/create_password_cubit/create_password_cubit.dart'
    as _i987;
import 'package:academic_elite/features/auth/presentation/manager/forgot_password_cubit/forgot_password_cubit.dart'
    as _i165;
import 'package:academic_elite/features/auth/presentation/manager/login_cubit/login_cubit.dart'
    as _i435;
import 'package:academic_elite/features/auth/presentation/manager/otp_verification_cubit/otp_verification_cubit.dart'
    as _i741;
import 'package:academic_elite/features/auth/presentation/manager/register_cubit/register_cubit.dart'
    as _i100;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.singleton<_i394.ApiManager>(() => _i394.ApiManager());
    gh.lazySingleton<_i161.InternetConnection>(
      () => networkModule.internetConnection,
    );
    gh.lazySingleton<_i476.AuthRemoteDataSource>(
      () => _i223.AuthRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i968.NetworkInfo>(
      () => _i968.NetworkInfoImpl(gh<_i161.InternetConnection>()),
    );
    gh.lazySingleton<_i148.AuthRepository>(
      () => _i307.AuthRepositoryImpl(
        gh<_i476.AuthRemoteDataSource>(),
        gh<_i968.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i790.CreatePasswordUseCase>(
      () => _i790.CreatePasswordUseCase(gh<_i148.AuthRepository>()),
    );
    gh.lazySingleton<_i895.ForgotPasswordUseCase>(
      () => _i895.ForgotPasswordUseCase(gh<_i148.AuthRepository>()),
    );
    gh.lazySingleton<_i932.LoginUseCase>(
      () => _i932.LoginUseCase(gh<_i148.AuthRepository>()),
    );
    gh.lazySingleton<_i102.RegisterUseCase>(
      () => _i102.RegisterUseCase(gh<_i148.AuthRepository>()),
    );
    gh.lazySingleton<_i1048.VerifyOtpUseCase>(
      () => _i1048.VerifyOtpUseCase(gh<_i148.AuthRepository>()),
    );
    gh.factory<_i165.ForgotPasswordCubit>(
      () => _i165.ForgotPasswordCubit(gh<_i895.ForgotPasswordUseCase>()),
    );
    gh.factory<_i100.RegisterCubit>(
      () => _i100.RegisterCubit(gh<_i102.RegisterUseCase>()),
    );
    gh.factory<_i435.LoginCubit>(
      () => _i435.LoginCubit(loginUseCase: gh<_i932.LoginUseCase>()),
    );
    gh.factory<_i987.CreatePasswordCubit>(
      () => _i987.CreatePasswordCubit(gh<_i790.CreatePasswordUseCase>()),
    );
    gh.factory<_i741.OtpVerificationCubit>(
      () => _i741.OtpVerificationCubit(
        verifyOtpUseCase: gh<_i1048.VerifyOtpUseCase>(),
        forgotPasswordUseCase: gh<_i895.ForgotPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i116.NetworkModule {}
