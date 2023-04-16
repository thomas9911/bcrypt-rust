#[derive(rustler::NifUnitEnum)]
pub enum Version {
    A,
    X,
    Y,
    B,
}

impl Into<bcrypt::Version> for Version {
    fn into(self) -> bcrypt::Version {
        match self {
            Version::A => bcrypt::Version::TwoA,
            Version::X => bcrypt::Version::TwoX,
            Version::Y => bcrypt::Version::TwoY,
            Version::B => bcrypt::Version::TwoB,
        }
    }
}

#[rustler::nif(schedule = "DirtyCpu")]
fn hash(password: &str) -> Result<String, String> {
    match bcrypt::hash(password, bcrypt::DEFAULT_COST) {
        Ok(hash) => Ok(hash),
        Err(err) => Err(err.to_string()),
    }
}

#[rustler::nif(schedule = "DirtyCpu")]
fn verify(password: &str, hash_input: &str) -> Result<bool, String> {
    match bcrypt::verify(password, hash_input) {
        Ok(allowed) => Ok(allowed),
        Err(err) => Err(err.to_string()),
    }
}

#[rustler::nif(schedule = "DirtyCpu")]
fn hash_with_version(password: &str, version: Version) -> Result<String, String> {
    match bcrypt::hash_with_result(password, bcrypt::DEFAULT_COST) {
        Ok(parts) => Ok(parts.format_for_version(version.into())),
        Err(err) => Err(err.to_string()),
    }
}

rustler::init!(
    "Elixir.BcryptRust.Native",
    [hash, hash_with_version, verify]
);
