// Derives implementable service interfaces from the generated `GenService`
// descriptors that protoc-gen-es emits.

import type { DescMessage, MessageShape } from "@bufbuild/protobuf";
import type {
  GenService,
  GenServiceMethods,
} from "@bufbuild/protobuf/codegenv2";

/**
 * Maps a generated `GenService` to an implementor interface.
 */
export type ServiceImpl<
  SvcT extends GenService<GenServiceMethods>,
  CtxT = unknown,
> = {
  [K in keyof SvcT["method"]]: (
    req: MessageShape<SvcT["method"][K]["input"]>,
    ctx: CtxT,
  ) => Promise<MessageShape<SvcT["method"][K]["output"]>>;
};

export type RegisterHandlerFn = (
  route: string,
  input: DescMessage,
  output: DescMessage,
  handler: (req: any, ctx: any) => Promise<any>,
) => void;

export interface RegisteredService {
  routes: string[];
}

export function registerService<
  S extends GenService<GenServiceMethods>,
  CtxT = unknown,
>(
  register: RegisterHandlerFn,
  service: S,
  impl: ServiceImpl<S, CtxT>,
): RegisteredService {
  const paths: string[] = [];
  for (const [localName, method] of Object.entries(service.method)) {
    const path = `/${service.typeName}/${method.name}`;
    register(
      path,
      method.input,
      method.output,
      impl[localName as keyof typeof impl] as (
        req: any,
        ctx: any,
      ) => Promise<any>,
    );
    paths.push(path);
  }
  return {
    routes: paths,
  };
}
