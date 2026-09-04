#ifndef ITRC_H
#define ITRC_H

struct _tagiTRCPadInfo
{
};

namespace iTRCDisk
{
    bool CheckDVDAndResetState();
} // namespace iTRCDisk

namespace ResetButton
{
    void EnableReset();
    void DisableReset();

} // namespace ResetButton

#endif
